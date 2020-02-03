//
//  DefaultViewController.swift
//  Lesson12
//
//  Created by Михаил Беленко on 31.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import DTTableViewManager
import DTModelStorage

class DefaultViewController: UIViewController, DTTableViewManageable {

    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        manager.register(WeatherTableViewCell.self)

        WeatherDefaultLoader().loadWeather { [unowned self] nameCity, weather in
            self.nameCityLabel.text = nameCity
            self.manager.memoryStorage.setItems(weather)
        }
    }
}
