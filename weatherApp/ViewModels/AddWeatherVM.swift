//
//  AddWeatherVM.swift
//  weatherApp
//
//  Created by vishnuprasadm on 02/06/25.
//

import Foundation
class AddWeatherVM {
    func addWeather( for city : String,completion : @escaping (WeatherVm)->()){
        guard let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=40ca58efce193db0fc801564afb08283&Unit=Metric") else {
            fatalError("URL Error")
        }
        let resource = Resource<WeatherResponse> (url: weatherURL){ response in
            return try? JSONDecoder().decode(WeatherResponse.self, from: response)
        }
        WebSevices().loadData(resource: resource){response in
                    if let response = response{
                        let vm = WeatherVm(weather : response)
                        completion(vm)
                        print(response)
                    }
        
                }
    }
}

