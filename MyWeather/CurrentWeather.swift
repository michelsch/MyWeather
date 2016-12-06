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
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = "Error fetching weather type"
        }
        return _weatherType
    }
    
    var currentTemp:Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeather(completed:DownloadComplete) {
        let url = URL(string:WEATHER_URL)!
        Alamofire.request(url).responseJSON { response in
            let result = response.result
            print(result)
            print(response)
        }
        completed()
    }
}
