//
//  AddWeatherVM.swift
//  weatherApp
//
//  Created by vishnuprasadm on 02/06/25.
//

import Foundation
class AddWeatherVM {
    
    func addWeather( for city : String,completion : @escaping (WeatherVm)->()){
        let weatherURL = getURL(city: city)
        let resource = Resource<WeatherResponse> (url: weatherURL){ response in
            return try? JSONDecoder().decode(WeatherResponse.self, from: response)
        }
        WebSevices().loadData(
            resource: resource,
            completion: {response in
                if let response = response{
                    let vm = WeatherVm(weather : response)
                    completion(vm)
                }})
    }
    func getURL (city: String)-> URL{
        guard let apiKey = KeychainHelper.shared.read(key: "weatherAPIKey") else {
            fatalError("API Key not found in Keychain")
        }
        guard let weatherURL = URL(string: "\(url.baseUrl.rawValue)/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric") else {
            fatalError("URL Error")
            
        }
        return weatherURL
    }
}

