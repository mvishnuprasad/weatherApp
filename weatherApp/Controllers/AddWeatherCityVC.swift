//
//  AddWeatherCityVC.swift
//  weatherApp
//
//  Created by vishnuprasad on 02/06/25.
//

import Foundation
import UIKit
class AddWeatherCityVC : UIViewController{
   private var addWeatherVM = AddWeatherVM()
    var delegate: AddweatherDelegate?
    @IBOutlet weak var cityNameTextField : UITextField!
    
    @IBAction func addCity() {
        if let city = cityNameTextField.text {
            
            
            if let city = cityNameTextField.text {
                addWeatherVM.addWeather(for: city ) {vm in
                    self.delegate?.addWeatherDidSave(vm: vm)
                    self.dismiss(animated: true)
                }
            }
            guard let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=40ca58efce193db0fc801564afb08283&Unit=Metric") else {
                fatalError("URL Error")
            }
            let resource = Resource<Any>(url: weatherURL){ data in
                return data
            }
            WebSevices().loadData(resource: resource ){ result in
                
            }
            
        }
        
    }
    @IBAction func close() {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityNameTextField.resignFirstResponder()
        self.cityNameTextField.selectedTextRange = nil
    }
}

protocol AddweatherDelegate {
    func addWeatherDidSave(vm: WeatherVm)
}
