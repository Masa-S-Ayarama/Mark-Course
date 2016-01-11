//
//  ApiKeys.swift
//  DevaDevs-Firebase-Showcase
//
//  Created by Nas@Mac on 11/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation

func valueForAPIKey(keyname keyname: String) -> String {
    
    let filePath = NSBundle.mainBundle().pathForResource("ApiKeys", ofType:"plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    
    let value:String = (plist?.objectForKey(keyname))! as! String
    return value
}

let Firebase_Base_Url = valueForAPIKey(keyname: "Firebase_URL_BASE")
let imageShackKey = valueForAPIKey(keyname: "ImageShack_KEY")