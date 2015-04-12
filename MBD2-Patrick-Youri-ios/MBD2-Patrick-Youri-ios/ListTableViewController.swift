//
//  ListTableViewController.swift
//  MBD2-Patrick-Youri-ios
//
//  Created by User on 12/04/15.
//  Copyright (c) 2015 Patrick-Youri. All rights reserved.
//

import UIKit
import CoreLocation

class ListTableViewController: UITableViewController, CLLocationManagerDelegate{
    
    var venues = [Venue]()
    var request = VenueRequest()
    let locManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        locManager.stopUpdatingLocation()
        var locationArray = locations as NSArray
        var locationObject = locationArray.lastObject as! CLLocation
        var coords = locationObject.coordinate
        
        request(coords)
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        locManager.stopUpdatingLocation()
        var coords = CLLocationCoordinate2D()
        coords.latitude = 51.6883248
        coords.longitude = 5.2869616
        
        request(coords)
    }
    
    func request(coords: CLLocationCoordinate2D){
        let qos = Int(QOS_CLASS_USER_INITIATED.value)
        dispatch_async(dispatch_get_global_queue(qos, 0), {
            let dictionary = self.request.doRequest(coords)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.venues = self.request.parseNSDictionary(dictionary)
                self.tableView.reloadData()
            })
        })
    }

    @IBAction func refreshButton(sender: UIBarButtonItem) {
        viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let venue = venues[indexPath.row]
        cell.textLabel?.text = venue.name

        return cell
    }

}
