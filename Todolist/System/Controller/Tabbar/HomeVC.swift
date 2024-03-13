//
//  HomeVC.swift
//  Todolist
//
//  Created by Abhi's Computers on 07/03/24.
//

import UIKit



class HomeVC: UIViewController, UISearchBarDelegate {
    
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nodataView: UIView!
    @IBOutlet weak var Tableview: UITableView!
 
   static var Taskdata = [TaskInfo]()
    var resultdata = Taskdata
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Tableview.delegate = self
        self.Tableview.dataSource = self
        self.Tableview.register(UINib(nibName: "HomeTaskCell", bundle: nil), forCellReuseIdentifier: "HomeTaskCell")
        self.searchBar.delegate = self
        print(URL.documentsDirectory)
        didloadSetup()
        self.searchBar.placeholder = "Search"
        self.searchBar.layer.cornerRadius = searchBar.frame.height / 2
        self.searchBar.layer.borderColor = UIColor.systemGray2.cgColor
        self.searchBar.layer.borderWidth = 1
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.didloadSetup()
    }
  
    @IBAction func profilebut(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "SettingVC")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func selectbutton (_ sender: UIButton) {
//        sender.setImage(UIImage(named: "BuletButfill"), for: .selected)
//        sender.setImage(UIImage(named: "buletBut"), for: .normal)
//        sender.isSelected.toggle()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        resultdata = []
        if searchText == "" {
            resultdata = HomeVC.Taskdata
            self.Tableview.reloadData()
        }else {
            
            resultdata = HomeVC.Taskdata.filter({ $0.taskname!.lowercased().contains(searchText.lowercased()) })
            self.Tableview.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    
}



extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func didloadSetup () {
        
        
        HomeVC.Taskdata = TodolistDataModel.Shared.gettaskdata()
        if HomeVC.Taskdata.count == 0 {
            self.Tableview.isHidden = true
            self.nodataView.isHidden = false
            
        }else {
            self.Tableview.isHidden = false
            self.nodataView.isHidden = true
        }
        self.resultdata = HomeVC.Taskdata
        self.Tableview.reloadData()
    }
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return resultdata.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        let titla = UILabel()
        titla.textColor = UIColor.white
        titla.text = "All Task"
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
        
          let index = resultdata[indexPath.row]
          
          let cell = Tableview.dequeueReusableCell(withIdentifier: "HomeTaskCell", for: indexPath) as! HomeTaskCell
          cell.tasknamelbl.text = index.taskname
          cell.tasktimelbl.text = "\(index.taskdate ?? "")" + " At \(index.tasktime ?? "")"
          cell.taskcategoryimgview.image = UIImage(named: "landscape\(index.taskcategoryimg ?? "9")" )
          
        
              switch (index.isTaskCompleted) {
              case (false):
                  
                  cell.selectedButton.setImage(UIImage(named: "buletBut"), for: .normal)
                 
              case (true):
                  
                  cell.selectedButton.setImage(UIImage(named: "Completed"), for: .normal)
                  
              }
          
        
          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let index = HomeVC.Taskdata[indexPath.row]
        
        let vc = UIStoryboard(name: "EditTask", bundle: nil).instantiateViewController(identifier: "TaskEditVC") as! TaskEditVC
        
        vc.index = indexPath.row
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
