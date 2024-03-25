//
//  WeatherAssembler.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

import UIKit

final class WeatherAssembler {
    static func assembly() -> UIViewController{
        let model = WeatherModel()
        let viewController = WeatherViewController()
        model.view = viewController
        
        return viewController
    }
}
