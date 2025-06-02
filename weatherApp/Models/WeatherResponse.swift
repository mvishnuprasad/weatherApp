//
//  WeatherResponse.swift
//  weatherApp
//
//  Created by vishnuprasad on 02/06/25.
//

import Foundation
struct Weather : Codable {
    let temp : Double
    let humidity: Double
}
struct WeatherResponse: Codable {
    let name : String
    let main : Weather
}
