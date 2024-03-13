//
//  TaskEditVC.swift
//  Todolist
//
//  Created by Abhi's Computers on 11/03/24.
//

import UIKit

class TaskEditVC: UIViewController {

    @IBOutlet var taskname: UILabel!
    @IBOutlet var tasktime: UILabel!
    @IBOutlet var taskcategoryEdit: UIButton!
    @IBOutlet var takstimeedit: UIButton!
    @IBOutlet weak var taskpriority: UIButton!
    @IBOutlet weak var EdittaskButton: UIButton!

    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.taskname.layer.cornerRadius = 5
        self.tasktime.layer.cornerRadius = 5
        self.taskpriority.layer.cornerRadius = 5
        self.EdittaskButton.layer.cornerRadius = 8
        self.takstimeedit.layer.cornerRadius = 5
        
        HomeVC.Taskdata = TodolistDataModel.Shared.gettaskdata()

        taskname.text = HomeVC.Taskdata[index].taskname
        tasktime.text = "Today A \(HomeVC.Taskdata[index].tasktime ?? "00 : 00")"
        takstimeedit.setTitle("Today At \(HomeVC.Taskdata[index].tasktime ?? "00 : 00")" , for: .normal)
        taskcategoryEdit.setImage(UIImage(named: "landscape\(HomeVC.Taskdata[index].taskcategoryimg ?? "9")" ), for: .normal)

        
    }
    @IBAction func backbut(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func editTaskButton(_ sender: UIButton) {
        TodolistDataModel.Shared.updateTaskInfo(modelArry: &HomeVC.Taskdata, newValue: taskname.text!, index: index, forkey: "taskname")
        self.viewDidLoad()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func edittaskname(_ sender: Any) {
        
        let vc = UIStoryboard(name: "EditTask", bundle: nil).instantiateViewController(withIdentifier: "TaskedittitleVC") as! TaskedittitleVC
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        vc.text = HomeVC.Taskdata[index].taskname!
        vc.index = index
        vc.dataUpdate = { result in
            
            self.taskname.text = result
        }
        self.present(vc, animated: true)
        
    }
    
    @IBAction func taskcompleted(_ sender: UIButton) {
        TodolistDataModel.Shared.updateTaskInfo(modelArry: &HomeVC.Taskdata, newValue: true, index: index, forkey: "isTaskCompleted")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteTask(_ sender: UIButton) {
        
        TodolistDataModel.Shared.deleteTask(modelArry: &HomeVC.Taskdata, index: index)
        self.navigationController?.popViewController(animated: true)

    }
    
}
