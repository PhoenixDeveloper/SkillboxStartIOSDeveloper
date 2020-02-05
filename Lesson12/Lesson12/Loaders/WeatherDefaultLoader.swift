//
//  WeatherDefaultLoader.swift
//  Lesson12
//
//  Created by Михаил Беленко on 03.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import Foundation

class WeatherDefaultLoader {

    func loadWeather(completion: @escaping (String, [WeatherTableViewCellModel]) -> Void) {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast?id=581049&appid=4cf8b5521e6a43563500b176a76d90c1")! // для Москвы нужно поменять id на 524901
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, responce, error in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary {
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

                RealmPersistence.storage.replaceSaveDatabase(database: weather)

                DispatchQueue.main.async {
                    completion(cityName, weather)
                }
            }
        }
        task.resume()
    }
}
