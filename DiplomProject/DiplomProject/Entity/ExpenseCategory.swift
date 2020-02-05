//
//  ExpenseCategory.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import RealmSwift

class ExpenseCategory: Object {
    @objc dynamic var name: String = ""
    let expensesList = List<Expense>()
}
