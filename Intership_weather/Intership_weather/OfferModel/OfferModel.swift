//
//  OfferModel.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

class OfferModel: Codable {
    var cod: String?
    var message:Float?
    var cnt:Float
    var list:[ListOfferModel]?
    var city: CityModel?
}
