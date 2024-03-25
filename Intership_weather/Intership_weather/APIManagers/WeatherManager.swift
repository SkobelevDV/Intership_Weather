//
//  WeatherManager.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

protocol WeatherManagerDescription{
    func getWeather(closure: @escaping (Result<Weather, CustomError>) -> Void)
}

final class WeatherManager :WeatherManagerDescription {
    
    static let shared: WeatherManagerDescription = WeatherManager()
    
    private init() {}
    
    func getWeather(closure: @escaping (Result<Weather, CustomError>) -> Void){// иммитация блока сетевого запроса - запрос след лек
        //result - стра-ра хранящая в себе 2 типа, либо Profile  в случае успеха, либо ошибку, в случае неудачи
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            //вызов метода задержки на 2 секунды, блок выполняется с задержкой 2 сек
            //запрос 2 секунды идёт на бэк, 1,5 сек обрабатывается на бэке и ещё пол секунды шёл обратно
            // эти 2 секунды просто сидели ждали и чтобы приожение не зависало мы делаем это асинхронно, те параллельно рабочей программе
            
            let weather = Weather (name: "Pogoda", email: "now", status: "Bad")
            let result: Result <Weather, CustomError> = .success(weather)
            closure(result)
        }
    }
}

