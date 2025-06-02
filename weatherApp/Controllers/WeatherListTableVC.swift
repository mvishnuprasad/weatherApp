//
//  WeatherListTableVC.swift
//  weatherApp
//
//  Created by vishnuprasad on 02/06/25.
//

import Foundation
import UIKit
class WeatherListTableVC : UITableViewController , AddweatherDelegate{
    private var weatherListVm = WeatherListVm()
    func addWeatherDidSave(vm: WeatherVm) {
        weatherListVm.addWeatherVM(vm)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        guard let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=40ca58efce193db0fc801564afb08283&Unit=Metric") else {
            fatalError("URL Error")
        }
//        let resource = Resource<WeatherResponse> (url: weatherURL){ response in
//            return try? JSONDecoder().decode(WeatherResponse.self, from: response)
//            
//        }
//        WebSevices().loadData(resource: resource){response in
//            if let response = response{
//                print(response)
//            }
//            
//        }
//        URLSession.shared.dataTask(with: weatherURL){ data , response ,error in
//            if let data = data {
//                DispatchQueue.main.async{
//                   print(try? JSONDecoder().decode(WeatherResponse.self, from: data)) 
//                }
//                print(data)
//            }else{
//                 
//            }
//        }.resume()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListVm.numOfRows(section)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else {
            return UITableViewCell()
        }
        let weatherVM = weatherListVm.weatherAt(indexPath.row)
        cell.configure(weatherVM)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeather" {
            prepareSegue(segue:segue)
        }
    }
    func prepareSegue(segue: UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Error")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityVC else {
            fatalError("Error")
        }
        addWeatherCityVC.delegate = self
    }
}
