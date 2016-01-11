//
//  Weather.swift
//  web-weather-app
//
//  Created by Nas@Mac on 7/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _city: String!
    private var _countryId: String!
    private var _cityId: Int!
    private var _main: String!
    private var _description: String!
    private var _humidity: Int!
    private var _temp: Float!
    private var _tempMin: Float!
    private var _tempMax: Float!
    private var _windSpeed: Float!
    private var _windDegree: Int!
    private var _rain1h: Float!
    private var _digitTime: Int!
    private var _weatherUrl: String!
    
    
    var city: String {
        get {
            if _city == nil {
                _city = ""
            }
            return _city
        }
    }
    var countryId: String {
        get {
            if _countryId == nil {
                _countryId = ""
            }
            return _countryId
        }
    }
    var cityId: Int {
        return _cityId
    }
    var main: String {
        get {
            if _main == nil {
                _main = ""
            }
            return _main
        }
    }
    var description: String {
        get {
            if _description == nil {
                _description = ""
            }
            return _description
        }
    }
    var humidity: Int {
        return _humidity
    }
    var temp: Float {
        return _temp
    }
    var tempMin: Float {
        return _tempMin
    }
    var tempMax: Float {
        return _tempMax
    }
    var windSpeed: Float {
        return _windSpeed
    }
    var windDegree: Int {
        return _windDegree
    }
    var rain1h: Float {
        return _rain1h
    }
    var digitTime: Int {
        return _digitTime
    }
    
    init() {
        self._countryId = "\(countryId)"
        _weatherUrl = "\(URL_BASE)\(URL_CITY)\(CITY_ID)\(METRIC_URL)\(SUFFIX_URL)"
        
       downloadWeatherDetails()
    }
    
//    init(city: String, cityId: Int) {
//        self._city = city
//        self._cityId = cityId
//        
//        _weatherUrl = "\(URL_BASE)\(URL_CITY)\(self._cityId)\(SUFFIX_URL)"
//    }
    
    
    func downloadWeatherDetails() { // (completed: DownloadComplete) {
        
        let url = NSURL(string: _weatherUrl)!
        
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._city = name
                }
                if let id = dict["id"] as? Int {
                    self._cityId = id
                }
                if let dt = dict["dt"] as? Int {
                    self._digitTime = dt
                }
                if let sys = dict["sys"] as? Dictionary<String, AnyObject> {
                    if let country = sys["country"] as? String {
                        self._countryId = country
                    }
                }
                if let weatherArr = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    for dict in weatherArr {
                        
                        if let main = dict["main"] as? String {
                            self._main = main
                        }
                        if let desc = dict["description"] as? String {
                            self._description = desc
                        }
                    }
                    
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let humidity = main["humidity"] as? Int {
                        self._humidity = humidity
                    }
                    if let temp = main["temp"] as? Float {
                        self._temp = temp
                    }
                    if let temp_min = main["temp_min"] as? Float {
                        self._tempMin = temp_min
                    }
                    if let temp_max = main["temp_max"] as? Float {
                        self._tempMax = temp_max
                    }
                }
                if let wind = dict["wind"] as? Dictionary<String, AnyObject> {
                    if let speed = wind["speed"] as? Float {
                        self._windSpeed = speed
                    }
                    if let deg = wind["deg"] as? Int {
                        self._windDegree = deg
                    }
                }
                if let rain = dict["rain"] as? Dictionary<String, AnyObject> {
                    if let rain1h = rain["1h"] as? Float {
                        self._rain1h = rain1h
                    }
                }
                
                print("\(self._city)")
                print("\(self._countryId)")
                print("\(self._cityId)")
                print("\(self._main)")
                print("\(self._description)")
                print("\(self._humidity)")
                print("\(self._temp)")
                print("\(self._tempMin)")
                print("\(self._tempMax)")
                print("\(self._windSpeed)")
                print("\(self._windDegree)")
                print("\(self._digitTime)")
                print("\(self._rain1h)")
                print("\(self._weatherUrl)")
                
            } // end dict
            
        } //end Alomofire
        
        //completed()
       
    }
    
    
    
    
}
