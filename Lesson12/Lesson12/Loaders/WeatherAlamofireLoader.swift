//
//  WeatherAlamofireLoader.swift
//  Lesson12
//
//  Created by Михаил Беленко on 03.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import Foundation
import Alamofire

class WeatherAlamofireLoader {

    func loadWeather(completion: @escaping (String, [WeatherTableViewCellModel]) -> Void) {
        // для Москвы нужно поменять id на 524901
        AF.request("http://api.openweathermap.org/data/2.5/forecast?id=581049&appid=4cf8b5521e6a43563500b176a76d90c1").responseJSON  { responce in
            if let objects = try? responce.result.get(),
                let jsonDict = objects as? NSDictionary {
                var weather: [WeatherTableViewCellModel] = []
                var cityName: String = ""

                if let list = jsonDict["list"] as? [NSDictionary] {
                    for element in list {
                        if let weatherDay = WeatherTableViewCellModel(data: element) {
                            weather.append(weatherDay)
                        }
                    }
                }

                if let city = jsonDict["city"] as? NSDictionary {
                    cityName = city["name"] as! String
                }


                DispatchQueue.main.async {
                    completion(cityName, weather)
                }
            }
        }
    }
}
