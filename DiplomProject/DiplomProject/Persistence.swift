//
//  Persistence.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import RealmSwift

class Persistence {

    static var storage = Persistence()

    private lazy var incomes: [Income] = Array(self.realm.objects(Income.self))
    private lazy var expensesCategory: [ExpenseCategory] = Array(self.realm.objects(ExpenseCategory.self))
    private lazy var expenses: [Expense] = Array(self.realm.objects(Expense.self))

    private let realm = try! Realm()

    func addIncome(income: Income) {
        try! realm.write {
            realm.add(income)
            incomes.append(income)
        }
    }

    func addCategoryExpense(category: ExpenseCategory) {
        try! realm.write {
            realm.add(category)
            expensesCategory.append(category)
        }
    }

    func addExpense(expense: Expense) {
        try! realm.write {
            realm.add(expense)
            expenses.append(expense)
        }
    }

    func getBalance() -> Float {
        return incomes.reduce(0, { $0 + $1.value }) + expenses.reduce(0, { $0 + $1.value })
    }

    func getCategories() -> [ExpenseCategory] {
        return expensesCategory
    }
}
