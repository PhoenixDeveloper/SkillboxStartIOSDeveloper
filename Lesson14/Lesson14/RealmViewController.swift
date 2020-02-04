//
//  RealmViewController.swift
//  Lesson14
//
//  Created by Михаил Беленко on 04.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import DTTableViewManager
import RxSwift
import RxCocoa

class RealmViewController: UIViewController, DTTableViewManageable {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!

    private var counterTask: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        manager.memoryStorage.setItems(RealmPersistence.storage.getAllTask())
        counterTask = RealmPersistence.storage.getCountTasks() + 1

        manager.register(ToDoListTableViewCell.self)
        configureCells()
        addTaskButton.layer.cornerRadius = addTaskButton.bounds.width / 2
    }

    private func configureCells() {
        manager.configure(ToDoListTableViewCell.self) { cell, model, _ in
            cell.compliteTaskButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [unowned cell, unowned model] _ in
                cell.setComplite()
                RealmPersistence.storage.changeTask(task: model, description: nil, isComplited: true)
            }).disposed(by: cell.disposeBag)

            cell.descriptionTaskTextView.rx.text.asObservable().subscribe(onNext: { [unowned model] text in
                RealmPersistence.storage.changeTask(task: model, description: text, isComplited: nil)
            }).disposed(by: cell.disposeBag)
        }

        manager.didSelect(ToDoListTableViewCell.self) { cell, _, _ in
            cell.setSelected(false, animated: true)
        }
    }
    
    @IBAction func addButtonClick(_ sender: Any) {
        let task = TaskRealmEntity()
        task.name = "Задача №\(counterTask)"
        counterTask += 1
        manager.memoryStorage.addItem(task)
        RealmPersistence.storage.addTask(task: task)
    }
}
