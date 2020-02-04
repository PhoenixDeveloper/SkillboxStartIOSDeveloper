//
//  UserDefaultsPersistence.swift
//  Lesson14
//
//  Created by Михаил Беленко on 04.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import Foundation

class UserDefaultsPersistence {
    static var storage = UserDefaultsPersistence()

    private let kFirstNameKey: String = "UserDefaultsPersistence.kFirstNameKey"
    var firstName: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: kFirstNameKey)
        }
        get {
            return UserDefaults.standard.string(forKey: kFirstNameKey)
        }
    }

    private let kLastNameKey: String = "UserDefaultsPersistence.kLastNameKey"
    var lastName: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: kLastNameKey)
        }
        get {
            return UserDefaults.standard.string(forKey: kLastNameKey)
        }
    }
}
