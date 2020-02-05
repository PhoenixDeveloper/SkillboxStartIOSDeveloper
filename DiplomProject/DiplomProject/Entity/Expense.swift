//
//  Expense.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import RealmSwift
import Foundation

class Expense: Object, Transaction {
    @objc dynamic var value: Float = 0.0
    @objc dynamic var date: Date = Date()
    @objc dynamic var category: ExpenseCategory?
}
