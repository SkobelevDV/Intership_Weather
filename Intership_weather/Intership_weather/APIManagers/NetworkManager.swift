//
//  NetworkManager.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

class NetworkManager {
    private init(){}
    static let shared: NetworkManager = NetworkManager()
        
    func getWeather (city:String, result: @escaping ((OfferModel?) -> ())) {
        var urlComponents = URLComponents()
        //https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=c6d9b8679c3cc12e95cb9c0ce2403377
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/forecast"
        urlComponents.queryItems = [
            URLQueryItem(name:"q",value : city),
            URLQueryItem(name:"appid", value : "c6d9b8679c3cc12e95cb9c0ce2403377")]
            
        var request = URLRequest(url : urlComponents.url!)
        request.httpMethod = "GET"
            
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) { (data,response,error) in
            if error == nil {
                let decoder = JSONDecoder()
                var decoderOfferModel:OfferModel?
                    
                if data != nil {
                    decoderOfferModel = try? decoder.decode(OfferModel.self, from: data!)
                    if (decoderOfferModel != nil) && (decoderOfferModel!.city != nil){
                        print(decoderOfferModel!.city!.name)
                    }
                    
                }
                result (decoderOfferModel)
            }
            else{
                print (error as Any)
            }
        }.resume()
            
    }
    
    func getTownFromLatLon (lat:Double,lon:Double, result: @escaping ((String) -> ())) {
        //http://api.openweathermap.org/geo/1.0/reverse?lat={lat}&lon={lon}&limit={limit}&appid={API key}
        var urlComponents = URLComponents()
        //https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=c6d9b8679c3cc12e95cb9c0ce2403377
        //https://api.openweathermap.org/geo/1.0/reverse?lat=51.5098&lon=-0.1180&limit=3&appid=c6d9b8679c3cc12e95cb9c0ce2403377
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/geo/1.0/reverse"
        urlComponents.queryItems = [
            URLQueryItem(name:"lat",value : String(lat)),
            URLQueryItem(name:"lon",value : String(lon)),
            URLQueryItem(name:"limit",value : "3"),
            URLQueryItem(name:"appid", value : "c6d9b8679c3cc12e95cb9c0ce2403377")]
            
        var request = URLRequest(url : urlComponents.url!)
        print(request)
        request.httpMethod = "GET"
            
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) { (data,response,error) in
            
            
            if error == nil {
                let decoder = JSONDecoder()
                var decoderOfferModel:[OfferModelForGeo]?
                
                    
                if data != nil {
                    print (data!)
                    decoderOfferModel = try? decoder.decode([OfferModelForGeo].self, from: data!)
                    if decoderOfferModel != nil {
                        print(decoderOfferModel![0].name)
                    }
                    else {
                        print ("model = nil")
                    }
                    
                }
                result (decoderOfferModel![0].name!)
            }
            else{
                print (error as Any)
            }
            
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    var decoderOfferModel:OfferModelForGeo?
//
//                    if data != nil {
//                        decoderOfferModel = try? decoder.decode(OfferModelForGeo.self, from: data!)
//                        if decoderOfferModel != nil {
//                            print(decoderOfferModel?.name)
//                        }
//                        print(decoderOfferModel)
//                    }
//                    result (decoderOfferModel)
//
//                }
//                else{
//                    print ("error in request")
//                }
//            }
            
        }.resume()
            
    }
    
}
