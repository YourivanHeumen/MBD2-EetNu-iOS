//
//  Venue.swift
//  MBD2-Patrick-Youri-ios
//
//  Created by User on 12/04/15.
//  Copyright (c) 2015 Patrick-Youri. All rights reserved.
//

import Foundation

public class Venue
{
    public let id: Int
    public let name: String
    public let category: String
    public let phonenumber: String
    public let website_url: String
    public let distance: Double
    public let address: Address
    
    init(id: Int, name: String!, category: String?, phonenumber: String?, website_url: String?, distance: Double?, address: Address) {
        self.id = id
        self.name = name
        if category != nil{
            self.category = category!
        } else {
            self.category = ""
        }
        if phonenumber != nil{
            self.phonenumber = phonenumber!
        } else {
            self.phonenumber = ""
        }
        if website_url != nil{
            self.website_url = website_url!
        } else {
            self.website_url = ""
        }
        if distance != nil{
            self.distance = distance!
        } else {
            self.distance = 0.0
        }
        self.address = address
    }
    
}