//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Daniel Chang on 9/1/17.
//  Copyright © 2017 dannyboyProductions. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = ViewController()
    
    @IBAction func addTapped(_ sender: Any) {
        //Create  a task from outlet information
        let task =  Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        //Add task to array in previous viewController
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true) //move back to previous VC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
