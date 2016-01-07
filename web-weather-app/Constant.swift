//
//  Constant.swift
//  web-weather-app
//
//  Created by Nas@Mac on 7/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation

//Main
let URL_BASE = "http://api.openweathermap.org"
let URL_CITY = "/data/2.5/weather?id="
let CITY_ID = "2643743"
let SUFFIX_URL = "&appid=2de143494c0b295cca9337e1e96b00e0"

//Details
let METRIC_URL = "&units=metric"
let IMPERIAL_URL = "&units=imperial"

// Create our own closure
typealias DownloadComplete = () -> ()