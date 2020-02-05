//
//  ExcenseScreenViewConroller + Alerts.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

extension ExcenseScreenViewConroller {

    func showAddExcenseAlert() {

        let alert = UIAlertController(title: "Добавление расхода", message: "Введите сумму расхода", preferredStyle: .alert)

        alert.addTextField()
        let textField = alert.textFields![0] // Force unwrapping because we know it exists.

        let saveAction = UIAlertAction(title: "OK", style: .default, handler: { [unowned self] (_) in
            let expense = Expense()
            expense.value = Float(textField.text!)!
            Persistence.storage.addExpenseInCategory(expense: expense, nameCategory: self.nameCategory)
            self.manager.memoryStorage.addItem(expense)
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
