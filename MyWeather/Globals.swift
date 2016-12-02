//
//  Globals.swift
//  MyWeather
//
//  Created by Michel Schoemaker on 12/1/16.
//  Copyright © 2016 Michel Schoemaker. All rights reserved.
//

import Foundation
import UIKit

let BASE_URL = "api.openweathermap.org/data/2.5/weather?"
let WEATHER_API_KEY = "c7245aecffd09e2c56db168265da0e14"

func hexStringToUIColor (hex:String) -> UIColor {
    
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.characters.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

extension UIColor {
    
    class var myPurple: UIColor {return hexStringToUIColor(hex: "5A4979")}
    class var myBlue: UIColor {return hexStringToUIColor(hex: "79C2CA")}
    class var myOrange: UIColor {return hexStringToUIColor(hex: "F3BD95")}
    class var myPink: UIColor {return hexStringToUIColor(hex: "F5ADAD")}
    
}
