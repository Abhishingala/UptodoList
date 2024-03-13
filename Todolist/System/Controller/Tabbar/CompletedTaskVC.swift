//
//  CompletedTaskVC.swift
//  Todolist
//
//  Created by Abhi's Computers on 11/03/24.
//

import UIKit

class CompletedTaskVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    
    @IBOutlet weak var nodataView: UIView!
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.register(UINib(nibName: "HomeTaskCell", bundle: nil), forCellReuseIdentifier: "HomeTaskCell")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HomeVC.Taskdata = TodolistDataModel.Shared.gettaskdata()
        if HomeVC.Taskdata.count == 0 {
            self.tableview.isHidden = true
            self.nodataView.isHidden = false
            
        }else {
            self.tableview.isHidden = false
            self.nodataView.isHidden = true
        }

        self.tableview.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var completet = 0
        for data in HomeVC.Taskdata {
            switch (data.isTaskCompleted) {
            case (true):
                completet += 1
            default:
               break
            }
        }
        
     
        return completet
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        let titla = UILabel()
        titla.textColor = UIColor.white
        titla.text = "Completet"
        titla.font = UIFont.boldSystemFont(ofSize: 15)
        titla.translatesAutoresizingMaskIntoConstraints = false
        
        let titlaview = UIView()
        titlaview.backgroundColor = UIColor.bg
        titlaview.translatesAutoresizingMaskIntoConstraints = false
        titlaview.layer.cornerRadius = 7
        titlaview.layer.borderColor = UIColor.systemGray3.cgColor
        titlaview.layer.borderWidth = 1
        titlaview.addSubview(titla)
        headerView.addSubview(titlaview)
        
        NSLayoutConstraint.activate([
        
            titlaview.topAnchor.constraint(equalTo: headerView.topAnchor),
            titlaview.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            titlaview.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 0),
            titlaview.rightAnchor.constraint(equalTo: headerView.rightAnchor , constant: -275),    titla.centerYAnchor.constraint(equalTo: titlaview.centerYAnchor),
            titla.centerXAnchor.constraint(equalTo: titlaview.centerXAnchor),
            
        ])
        
        return headerView
    }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          let index = HomeVC.Taskdata[indexPath.row]
          
          let cell = tableview.dequeueReusableCell(withIdentifier: "HomeTaskCell", for: indexPath) as! HomeTaskCell
      
          for i in HomeVC.Taskdata{
              
              switch (i.isTaskCompleted) {
                  
              case (true):
                  
                  cell.tasknamelbl.text = i.taskname
                  cell.tasktimelbl.text =  "Today At \(i.tasktime ?? "")"
                  
                  cell.taskcategoryimgview.image = UIImage(named: "landscape\(i.taskcategoryimg ?? "9")" )
                  return cell
                  
              default:
                  print("Invalid section")
                  break
                  
              }
          }
        return UITableViewCell()
    }
   
    
}
