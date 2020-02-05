//
//  ChartExpenseIncomeViewController.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import DTTableViewManager

class ChartExpenseIncomeViewController: UIViewController, DTTableViewManageable {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        manager.register(TransactionTableViewCell.self)
        changeSegmen(self)
    }

    private func setupUI() {
        navigationItem.title = "График расходов/доходов"
    }
    
    @IBAction func changeSegmen(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            manager.memoryStorage.setItems(Persistence.storage.getTransactionFromPeriod(with: Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date())!))
        case 1:
            manager.memoryStorage.setItems(Persistence.storage.getTransactionFromPeriod(with: Calendar.current.date(byAdding: .month, value: -1, to: Date())!))
        case 2:
            manager.memoryStorage.setItems(Persistence.storage.getTransactionFromPeriod(with: Calendar.current.date(byAdding: .month, value: -3, to: Date())!))
        case 3:
            manager.memoryStorage.setItems(Persistence.storage.getTransactionFromPeriod(with: Date.init(timeIntervalSince1970: 0)))
        default:
            fatalError("imposible")
        }
    }
}
