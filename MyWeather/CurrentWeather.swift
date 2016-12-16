//
//  CurrentWeather.swift
//  MyWeather
//
//  Created by Michel Schoemaker on 12/1/16.
//  Copyright © 2016 Michel Schoemaker. All rights reserved.
//

import UIKit
import Alamofire

//model for current temperature, to be fecthed by openweather API and displayed in Main.storyboard

class CurrentWeather {
    
    var _weatherType:String!
    var _currentTemp:Double!
    var _sunriseTime:TimeInterval!
    var _sundownTime:TimeInterval!
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = "Error getting weather type"
        }
        return _weatherType
    }
    
    var currentTemp:Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var sunriseTime: TimeInterval {
        if _sunriseTime == nil {
            _sunriseTime = NSDate().timeIntervalSince1970
        }
        return _sunriseTime
    }
    
    var sundownTime: TimeInterval {
        if _sundownTime == nil {
            _sundownTime = NSDate().timeIntervalSince1970
        }
        return _sundownTime
    }
    
    func downloadWeather(completed:DownloadComplete) {
        let url = URL(string:WEATHER_URL)!
        Alamofire.request(url).responseJSON { response in
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get todo object as JSON from API")
                print("Error: \(response.result.error)")
                return
            }
            //let sys = json as? [String:Any]
        }
        completed()
    }
}
