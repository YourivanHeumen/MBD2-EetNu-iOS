//
//  DetailViewController.swift
//  MBD2-Patrick-Youri-ios
//
//  Created by User on 11/04/15.
//  Copyright (c) 2015 Patrick-Youri. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var venueNameLabel: UILabel!
    
    @IBOutlet weak var venueCategoryLabel: UILabel!
    
    @IBOutlet weak var venuePhoneLabel: UILabel!
    
    @IBOutlet weak var venueWebsiteLabel: UILabel!
    
    @IBOutlet weak var venueDistanceLabel: UILabel!
    
    
    var detailVenue: Venue?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    func updateUI() {
        if self.detailVenue != nil {
            venueNameLabel?.text = self.detailVenue!.name
            venueCategoryLabel?.text = self.detailVenue?.category
            venuePhoneLabel?.text = self.detailVenue?.phonenumber
            venueWebsiteLabel?.text = self.detailVenue?.website_url
            venueDistanceLabel?.text = String(stringInterpolationSegment: self.detailVenue!.distance)
        }
        
    }
    @IBAction func callAction(sender: UIButton) {
        if let phonenumber = self.detailVenue?.phonenumber.stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("+", withString: "")
        {
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(phonenumber)")!)
        }
    }
}
