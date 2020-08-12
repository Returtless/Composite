//
//  Task.swift
//  Composite
//
//  Created by Владислав Лихачев on 10.08.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import Foundation

protocol Tasks {
    var name : String {get}
    var subtasks : [Task] {get}
    var parent: Task? { get set }
}


class Task : Tasks {
    
    private(set) var name: String
    
    private(set) var subtasks: [Task]
    
    var parent: Task?
    
    internal init(name: String, subtasks : [Task]) {
        self.name = name
        self.subtasks = subtasks
    }
    
    func addSubtask(task : Task){
        task.parent = self
        subtasks.append(task)
    }
    
    func getDescription() -> String{
        return "\(name) содержит \(subtasks.count) подзадач"
    }
}
