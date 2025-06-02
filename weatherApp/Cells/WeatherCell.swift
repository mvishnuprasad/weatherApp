//
//  WeatherCell.swift
//  weatherApp
//
//  Created by vishnuprasad on 02/06/25.
//

import Foundation
import UIKit
class WeatherCell : UITableViewCell {
    @IBOutlet weak var cityNameLabel : UILabel!
    @IBOutlet weak var tempLabel : UILabel!
    func configure( _ vm : WeatherVm){
        self.cityNameLabel?.text = vm.city
        self.tempLabel?.text = "\(vm.temp)°"
    }
}



