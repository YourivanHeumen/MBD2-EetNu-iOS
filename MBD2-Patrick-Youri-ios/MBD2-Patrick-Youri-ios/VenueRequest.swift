//
//  VenueRequest.swift
//  MBD2-Patrick-Youri-ios
//
//  Created by User on 12/04/15.
//  Copyright (c) 2015 Patrick-Youri. All rights reserved.
//

import Foundation

public class VenueRequest
{
    private let url = "https://api.eet.nu/venues?max_distance=1&geolocation=51.6883248,5.2869616"
    
    
    func doRequest() -> NSDictionary
    {
        let json = getJSON(self.url)
        return parseJSON(json)
    }
    
    func getVenues(dictionary: NSDictionary) -> [Venue]
    {
        return parseNSDictionary(dictionary)
    }
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: self.url)!) ?? NSData(contentsOfURL: NSURL(string: "")!)!
    }
    
    func parseJSON(inputData: NSData) -> NSDictionary{
        var error: NSError?
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
        
        return boardsDictionary
    }
    
    func parseNSDictionary(inputDictionary: NSDictionary) -> [Venue]{
        var venues = [Venue]()
        if let objects = inputDictionary["results"] as? NSArray{
            for object in objects
            {
                var values = Dictionary<String, AnyObject>()
                if let vObject = object as? NSDictionary{
                    for (key, value) in vObject
                    {
                        if let keyString = key as? String{
                            switch keyString
                            {
                                case "id":
                                    values["id"] = value as? Int
                                case "name":
                                    values["name"] = value as? String
                                case "category":
                                    values["category"] = value as? String
                                case "website_url":
                                    values["website_url"] = value as? String
                                case "telephone":
                                    values["telephone"] = value as? String
                                case "distance":
                                    values["distance"] = value as? Double
                                case "address":
                                    if let addressObject = value as? NSDictionary{
                                        for (k, v) in addressObject{
                                            if let kString = k as? String{
                                                switch kString
                                                {
                                                    case "country","street","region","city","zipcode":
                                                        values[kString] = v as? String
                                                    default:
                                                        break
                                                }
                                            }
                                        }
                                    }
                                default:break
                            }
                        }
                    }
                    var venue = Venue(id: values["id"] as! Int, name: values["name"] as! String, category: values["category"] as? String, phonenumber: values["telephone"] as? String, website_url: values["website_url"] as? String, distance: values["distance"] as? Double, address: Address(street: values["street"] as? String, zipcode: values["zipcode"] as? String, city: values["city"] as? String, region: values["region"] as? String, country: values["country"] as? String))
                    venues.append(venue)
                }
            }
        }
        return venues
    }
    
}