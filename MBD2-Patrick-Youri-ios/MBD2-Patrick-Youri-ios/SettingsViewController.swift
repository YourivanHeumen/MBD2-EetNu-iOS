//
//  SettingsViewController.swift
//  MBD2-Patrick-Youri-ios
//
//  Created by User on 11/04/15.
//  Copyright (c) 2015 Patrick-Youri. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var Distance: UILabel!
    @IBAction func sliderValueChanged(sender: UISlider) {
        var distanceValue = Int(sender.value)
        Distance.text = "\(distanceValue) Km"
    }
}
