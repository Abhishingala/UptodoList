//
//  HomeVC.swift
//  Todolist
//
//  Created by Abhi's Computers on 07/03/24.
//

import UIKit



class HomeVC: UIViewController {
    
    

    @IBOutlet weak var nodataView: UIView!
    @IBOutlet weak var Tableview: UITableView!
 
    var Taskdata = [TaskInfo]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        didloadSetup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Taskdata = TodolistDataModel.Shared.gettaskdata()
        self.Tableview.reloadData()
    }
  
    
    @objc func selectbutton (_ sender: UIButton) {
//        sender.setImage(UIImage(named: "BuletButfill"), for: .selected)
//        sender.setImage(UIImage(named: "buletBut"), for: .normal)
//        sender.isSelected.toggle()
        
    }
}


extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func didloadSetup () {
        
        self.Tableview.delegate = self
        self.Tableview.dataSource = self
        self.Tableview.register(UINib(nibName: "HomeTaskCell", bundle: nil), forCellReuseIdentifier: "HomeTaskCell")
        Taskdata = TodolistDataModel.Shared.gettaskdata()
        if Taskdata.count == 0 {
            self.Tableview.isHidden = true
            self.nodataView.isHidden = false
            
        }else {
            self.Tableview.isHidden = false
            self.nodataView.isHidden = true
        }

        self.Tableview.reloadData()
    }
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var today = 0
        var completet = 0
        for data in Taskdata {
            switch (section , data.isTaskCompleted) {
            case (0 ,  false):
                today += 1
    
            case (1 , true):
                completet += 1
            default:
               break
            }
        }
        
        if section == 0 {
            return today
        }else {
            return completet
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        let titla = UILabel()
        titla.textColor = UIColor.white
        titla.text = section == 0 ? "Today" : "Completet"
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
        
        let index = Taskdata[indexPath.row]
        
        switch (indexPath.section , index.isTaskCompleted) {
        case (0 , false):
            let cell = Tableview.dequeueReusableCell(withIdentifier: "HomeTaskCell", for: indexPath) as! HomeTaskCell
            let index = Taskdata[indexPath.row]
            cell.tasknamelbl.text = index.taskname
            cell.tasktimelbl.text =  "Today At \(index.tasktime ?? "")"
            cell.selectedButton.addTarget(self, action: #selector(selectbutton(_:)), for: .touchDown)
            cell.taskcategoryimgview.image = UIImage(named: "landscape\(index.taskcategoryimg ?? "9")" )

            return cell

        case (1 , true):
            let cell = Tableview.dequeueReusableCell(withIdentifier: "HomeTaskCell", for: indexPath) as! HomeTaskCell
            let index = Taskdata[indexPath.row]
            cell.tasknamelbl.text = index.taskname
            cell.tasktimelbl.text = index.tasktime
            return cell
            
        default:
            print("Invalid section")
            
        }
        return UITableViewCell()
    }
    
}
