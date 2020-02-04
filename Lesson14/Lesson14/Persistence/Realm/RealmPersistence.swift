//
//  RealmPersistence.swift
//  Lesson14
//
//  Created by Михаил Беленко on 04.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import RealmSwift

class RealmPersistence {
    static var storage = RealmPersistence()

    private let realm = try! Realm()

    func addTask(task: TaskRealmEntity) {
        try! realm.write {
            realm.add(task)
        }
    }

    /// Save description or isComplited nil if you do not want to change these parameters
    func changeTask(task: TaskRealmEntity, description descriptionInput: String? = nil, isComplited isComplitedInput: Bool? = nil) {
        let description: String = descriptionInput ?? task.notes
        let isComplited: Bool = isComplitedInput ?? task.isCompleted
        
        try! realm.write {
            task.notes = description
            task.isCompleted = isComplited
        }
    }

    func getAllTask() -> [TaskRealmEntity] {
        var arrayTask: [TaskRealmEntity] = []
        for task in realm.objects(TaskRealmEntity.self) {
            arrayTask.append(task)
        }
        return arrayTask
    }

    func getCountTasks() -> Int {
        return realm.objects(TaskRealmEntity.self).count
    }
}
