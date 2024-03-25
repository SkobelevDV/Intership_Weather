//
//  WeatherModel.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

import UIKit


protocol WeatherViewInput: AnyObject {
    func onModelChanged()
}
//формирование delegate
//protocol оычно исп-ся для наследовани структуры и чтобы показать, что наследуем класс нужно добавить эниobject

final class WeatherModel {
    weak var view: WeatherViewInput?
    //паттерн проектирования, при помощи которого будем передавать некоторые события нашему view контроллеру
    //weak - сллабая ссылка на делегат чтобы не возникло цикла ссылок
    
    private(set) var weather: Weather?
    private(set) var isLoading: Bool = false
    private(set) var error: CustomError?
    //только когда запрос выполнся станет значением до того момента nil
    //private - когда не можем достучаться до переменной снаружи
    //set - когда можем изменять только в этом классе

    
    private let weatherManager: WeatherManagerDescription

    
    init (weatherManager: WeatherManagerDescription = WeatherManager.shared){
        self.weatherManager = weatherManager
    }
    
    
    
    func loadWeather() {
        isLoading = true
        view?.onModelChanged()

        weatherManager.getWeather { result in
            
            
            self.isLoading = false
            switch result {
            case .success(let weather):
                self.error = nil
                self.weather = weather
            case .failure(let error):
                self.error = error
            }
            
            self.view?.onModelChanged()
        }
    }

    func changeStatus(with status: String) {

        weather?.status = status
        view?.onModelChanged()
    }
}

