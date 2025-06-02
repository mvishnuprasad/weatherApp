//
//  WeatherListVm.swift
//  weatherApp
//
//  Created by vishnuprasad  on 02/06/25.
//

import Foundation

class WeatherListVm {
    private var weatherViewModels = [WeatherVm]()
    
    func addWeatherVM(_ vm : WeatherVm){
        weatherViewModels.append(vm)
    }
    func numOfRows(_ section : Int)-> Int {
        return weatherViewModels.count
    }
    func weatherAt (_ index : Int) -> WeatherVm {
        return weatherViewModels[index]
    }
    
}
class WeatherVm {
    let weather : WeatherResponse
    init(weather: WeatherResponse) {
        self.weather = weather
    }
    var city : String{
        return weather.name
    }
    var temp : Double{
        return weather.main.temp
    }
}
