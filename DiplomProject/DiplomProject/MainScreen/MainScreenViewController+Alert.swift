//
//  MainScreenViewController+Alert.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension MainScreenViewController {

    func showAddCategotyAlert() {

        let alert = UIAlertController(title: "Добавление категории расходов", message: "Введите название категории", preferredStyle: .alert)

        alert.addTextField()
        let textField = alert.textFields![0] // Force unwrapping because we know it exists.

        let saveAction = UIAlertAction(title: "OK", style: .default, handler: { [unowned self] (_) in
            let category = ExpenseCategory()
            category.name = textField.text!
            Persistence.storage.addCategoryExpense(category: category)
            self.manager.memoryStorage.addItem(category)
        })

        let cancelAction = UIAlertAction(title: "Отмена",
            style: .default) { (action: UIAlertAction!) -> Void in
        }

        textField.rx.text.subscribe(onNext: { text in
            if let text = text, !text.isEmpty {
                saveAction.isEnabled = true
            }
            else {
                saveAction.isEnabled = false
            }
            }).disposed(by: disposeBag)

        alert.addAction(saveAction)
        alert.addAction(cancelAction)


        self.present(alert, animated: true, completion: nil)
    }

    func showAddIncomeAlert() {

        let alert = UIAlertController(title: "Добавление дохода", message: "Введите сумму дохода", preferredStyle: .alert)

        alert.addTextField()
        let textField = alert.textFields![0] // Force unwrapping because we know it exists.

        let saveAction = UIAlertAction(title: "OK", style: .default, handler: { [unowned self] (_) in
            let income = Income()
            income.value = Float(textField.text!)!
            Persistence.storage.addIncome(income: income)
            self.balanceLabel.text = "\(Persistence.storage.getBalance()) ₽"
        })

        let cancelAction = UIAlertAction(title: "Отмена",
            style: .default) { (action: UIAlertAction!) -> Void in
        }

        textField.rx.text.subscribe(onNext: { text in
            if let text = text, let value = Float(text), !text.isEmpty && value > 0 {
                saveAction.isEnabled = true
            }
            else {
                saveAction.isEnabled = false
            }
            }).disposed(by: disposeBag)

        alert.addAction(saveAction)
        alert.addAction(cancelAction)


        self.present(alert, animated: true, completion: nil)
    }
}
