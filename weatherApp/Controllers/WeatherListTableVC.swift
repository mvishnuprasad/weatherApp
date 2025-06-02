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
        KeychainHelper.shared.save(key: "weatherAPIKey", value: "40ca58efce193db0fc801564afb08283")
 
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
