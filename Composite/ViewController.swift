//
//  ViewController.swift
//  Composite
//
//  Created by Владислав Лихачев on 10.08.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var task : Task = Task(name: "mainTask", subtasks: [])
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "+", style: .done, target: self, action: #selector(self.action(sender:)))
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc func action(sender: UIBarButtonItem) {
        task.addSubtask(task: Task(name: "subtask\(task.subtasks.count+1)", subtasks: []))
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier : "ViewController") as! ViewController
        vc.task = task.subtasks[indexPath.row]
        self.navigationController!.pushViewController(vc, animated : true)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        task.subtasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        cell.titleLabel?.text = task.subtasks[indexPath.row].getDescription()
        return cell
    }
    
    
}
