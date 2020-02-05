//
//  RealmPersistence.swift
//  Lesson12
//
//  Created by Михаил Беленко on 04.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import RealmSwift

class RealmPersistence {

    static var storage = RealmPersistence()

    var realm = try! Realm()

    func addEntry(entry: WeatherTableViewCellModel) {
        try! realm.write {
            realm.add(entry)
        }
    }

    func replaceSaveDatabase(database: [WeatherTableViewCellModel]) {
        clearDatabase()
        for entry in database {
            addEntry(entry: entry)
        }
    }

    func getSaveDatabase() -> [WeatherTableViewCellModel] {
        var database: [WeatherTableViewCellModel] = []
        for entry in realm.objects(WeatherTableViewCellModel.self) {
            database.append(entry)
        }
        return database
    }

    func clearDatabase() {
        let database = realm.objects(WeatherTableViewCellModel.self)

        try! realm.write {
            realm.delete(database)
        }
    }
}
