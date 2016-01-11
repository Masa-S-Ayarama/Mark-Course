//
//  ApiKeys.swift
//  web-weather-app
//
//  Created by Nas@Mac on 8/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation

func valueForAPIKey(keyname keyname: String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource("ApiKeys", ofType: "plist")
    let plist = NSDictionary(contentsOfFile: filePath!)
    let value:String = plist?.objectForKey(keyname) as! String
    
    return value
}

let clientID = valueForAPIKey(keyname: "API_CLIENT_ID")
