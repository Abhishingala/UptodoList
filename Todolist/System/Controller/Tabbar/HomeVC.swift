//
//  HomeVC.swift
//  Todolist
//
//  Created by Abhi's Computers on 07/03/24.
//

import UIKit

struct sectionData {
    
    var title: String
    var task: [String]
    var taskname: String
    var tasktime: String
    var taskdate: String
    var category: String
    var isButselet: Bool
    
//    init(title: String) {
//        self.title = title
//    }
//    init(taskname: String , tasktime: String , category: String, isButselet: Bool){
//        self.taskname = taskname
//        self.tasktime = tasktime
//        self.category = category
//        self.isButselet = isButselet
//    }
    
}

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var Tableview: UITableView!
    
    let Taskdata = [sectionData]() /*= [sectionData(title: "Today", task: []), sectionData(title: "Completed", task: <#T##[String]#>)]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.Tableview.delegate = self
        self.Tableview.dataSource = self
        self.Tableview.register(UINib(nibName: "HomeTaskCell", bundle: nil), forCellReuseIdentifier: "HomeTaskCell")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Tableview.dequeueReusableCell(withIdentifier: "HomeTaskCell", for: indexPath) as! HomeTaskCell
        
        cell.tasknamelbl.text = "TAskname"
        cell.tasktimelbl.text = "8.00 AM"
        
        return cell
    }
    
  

}
