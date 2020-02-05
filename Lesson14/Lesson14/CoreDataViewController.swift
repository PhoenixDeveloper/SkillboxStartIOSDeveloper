//
//  CoreDataViewController.swift
//  Lesson14
//
//  Created by Михаил Беленко on 04.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import CoreData
import DTTableViewManager

class CoreDataViewController: UIViewController, DTTableViewManageable {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    
    private var counterTask: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        manager.memoryStorage.setItems(CoreDataPersistence.storage.getAllTask())
        counterTask = CoreDataPersistence.storage.getCountTasks() + 1

        manager.register(CoreDataToDoListTableViewCell.self)
        configureCells()
        addTaskButton.layer.cornerRadius = addTaskButton.bounds.width / 2
    }

    private func configureCells() {
        manager.configure(CoreDataToDoListTableViewCell.self) { cell, _, indexPath in
            cell.compliteTaskButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [unowned cell] _ in
                cell.setComplite()
                CoreDataPersistence.storage.changeTask(index: indexPath.row, description: nil, isComplited: true)
            }).disposed(by: cell.disposeBag)

            cell.descriptionTaskTextView.rx.text.asObservable().subscribe(onNext: { text in
                CoreDataPersistence.storage.changeTask(index: indexPath.row, description: text, isComplited: nil)
            }).disposed(by: cell.disposeBag)
        }

        manager.didSelect(CoreDataToDoListTableViewCell.self) { cell, _, _ in
            cell.setSelected(false, animated: true)
        }
    }

    @IBAction func addButtonClick(_ sender: Any) {
        let name = "Задача №\(counterTask)"
        counterTask += 1
        manager.memoryStorage.addItem(CoreDataPersistence.storage.addTask(name: name))
    }
}
