//
//  CoreDataPersistence.swift
//  Lesson14
//
//  Created by Михаил Беленко on 04.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import CoreData
import UIKit

class CoreDataPersistence {
    static var storage = CoreDataPersistence()

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private lazy var managedContext = self.appDelegate.persistentContainer.viewContext
    private lazy var entity = NSEntityDescription.entity(forEntityName: "TaskCoreDataEntity",
                                                         in: self.managedContext)!

    private lazy var tasks: [TaskCoreDataEntity] = try! self.managedContext.fetch(NSFetchRequest<TaskCoreDataEntity>(entityName: "TaskCoreDataEntity"))

    func addTask(name: String) -> TaskCoreDataEntity {
        let task = TaskCoreDataEntity(entity: entity,
                                   insertInto: managedContext)

        task.setValue(name, forKeyPath: "name")
        task.setValue(Date(), forKey: "createdAt")

        do {
            try managedContext.save()
            tasks.append(task)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        return task
    }

    /// Save description or isComplited nil if you do not want to change these parameters
    func changeTask(index: Int, description descriptionInput: String? = nil, isComplited isComplitedInput: Bool? = nil) {
        let description: String = descriptionInput ?? tasks[index].value(forKey: "notes") as! String
        let isComplited: Bool = isComplitedInput ?? tasks[index].value(forKey: "isCompleted") as! Bool

        do {
            tasks[index].setValue(description, forKey: "notes")
            tasks[index].setValue(isComplited, forKey: "isCompleted")
            try managedContext.save()
        } catch let error as NSError {
            print("Could not change. \(error), \(error.userInfo)")
        }
    }

    func getAllTask() -> [TaskCoreDataEntity] {
        return tasks
    }

    func getCountTasks() -> Int {
        return tasks.count
    }
}
