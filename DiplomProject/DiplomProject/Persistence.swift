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

    func addExpenseInCategory(expense: Expense, nameCategory: String) {
        guard let category = realm.objects(ExpenseCategory.self).filter({ $0.name == nameCategory }).first else { fatalError("not found category") }
        try! realm.write {
            expense.category = category
            realm.add(expense)
            expenses.append(expense)
            category.expensesList.append(expense)
        }
    }

    func getBalance() -> Float {
        return incomes.reduce(0, { $0 + $1.value }) - expenses.reduce(0, { $0 + $1.value })
    }

    func getCategories() -> [ExpenseCategory] {
        return expensesCategory
    }

    func getTransactionFromPeriod(with date: Date) -> [Transaction] {
        return (incomes + expenses)
            .sorted(by: { $0.date > $1.date })
            .filter({ $0.date >= date })
    }

    func getExpensesFromCategory(nameCategory: String) -> [Expense] {
        guard let category = realm.objects(ExpenseCategory.self).filter({ $0.name == nameCategory }).first else { fatalError("not found category") }
        return Array(category.expensesList)
    }
}
