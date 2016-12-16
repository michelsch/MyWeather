//
//  WeatherVC.swift
//  MyWeather
//
//  Created by Michel Schoemaker on 12/1/16.
//  Copyright © 2016 Michel Schoemaker. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var gradientView: UIView!

    @IBOutlet weak var temperatureLabel: UILabel!
    
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWeather.downloadWeather {
            print(currentWeather)
            updateUI()
        }
        
    }
    
    func updateUI() {
         gradientView.layer.insertSublayer(getGradientColors(), at: 0)
    }
    
    func getGradientColors() -> CAGradientLayer {
        //get current unix time
        let current = NSDate().timeIntervalSince1970
        
        print(current)
        print()
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [UIColor.myBlue.cgColor, UIColor.myOrange.cgColor]
        return gradient
    }
}

