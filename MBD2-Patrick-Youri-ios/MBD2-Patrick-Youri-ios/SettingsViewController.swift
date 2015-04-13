//
//  SettingsViewController.swift
//  MBD2-Patrick-Youri-ios
//
//  Created by User on 11/04/15.
//  Copyright (c) 2015 Patrick-Youri. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var Distance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var maxDistance: Float? = userDefaults.objectForKey("maxDistance") as? Float
        if (maxDistance == nil)
        {
            maxDistance = 10
            userDefaults.setObject(maxDistance, forKey: "maxDistance")
        }
        else
        {
            Slider.value = maxDistance!
            Distance.text = "\(maxDistance!) Km"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        var distanceValue = round(Float(sender.value) / 0.1) * 0.1
        Distance.text = "\(distanceValue) Km"
        userDefaults.setObject(distanceValue, forKey: "maxDistance")
    }
}
