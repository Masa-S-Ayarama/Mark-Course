//
//  ViewController.swift
//  web-weather-app
//
//  Created by Nas@Mac on 6/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var weathers = Weather()
        parseJSON()
        
    }
    
    
    func parseJSON() {
       
//        let pathFile = NSBundle.mainBundle().pathForResource("weather_14", ofType: "json")!
//        let data = NSData(contentsOfFile: pathFile)!
//        
//        do {
//            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
//            
//            if let dict = json as? Dictionary<String, AnyObject> {
//                if let id = dict["id"] as? Int {
//                    let weather = Weather(countryId: id)
//                }
//            }
//        } catch {
//            print("Could not serialize")
//        }
    
    }
    
    func locatioAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            
            locationManager.requestWhenInUseAuthorization()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

