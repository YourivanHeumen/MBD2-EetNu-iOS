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
    
    var detailVenue: Venue?
    
    func updateUI() {
        if self.detailVenue != nil {
            println(venueNameLabel)
            venueNameLabel?.text = self.detailVenue!.name
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
