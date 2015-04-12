//
//  Address.swift
//  MBD2-Patrick-Youri-ios
//
//  Created by User on 12/04/15.
//  Copyright (c) 2015 Patrick-Youri. All rights reserved.
//

import Foundation

public class Address
{
    public let street: String
    public let zipcode: String
    public let city: String
    public let region: String
    public let country: String
    
    init(street: String?, zipcode: String?, city: String?, region: String?, country: String?) {
        if street != nil{
            self.street = street!
        } else {
            self.street = ""
        }
        if zipcode != nil{
            self.zipcode = zipcode!
        } else {
            self.zipcode = ""
        }
        if city != nil{
            self.city = city!
        } else {
            self.city = ""
        }
        if region != nil{
            self.region = region!
        } else {
            self.region = ""
        }
        if country != nil{
            self.country = country!
        } else {
            self.country = ""
        }
    }
}