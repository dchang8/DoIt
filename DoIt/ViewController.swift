//
//  ViewController.swift
//  DoIt
//
//  Created by Daniel Chang on 9/1/17.
//  Copyright © 2017 dannyboyProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self //requires to add UITableViewDataSource class above
        tableView.delegate = self   //requires to add UITableViewDelegate class above
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10 //number of rows
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = " ‼️ \(task.name)"  //row content
        } else {
            cell.textLabel?.text = task.name  //row content
        }
        
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk Casper"
        task1.important = true
        
        let task2 = Task()
        task2.name = "Sleep"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Mow Lawn"
        task3.important = true
        
        return [task1, task2, task3]
        
    }

    @IBAction func plusTabbed(_ sender: Any) {
        performSegue(withIdentifier: "AddSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC =  segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }

}

