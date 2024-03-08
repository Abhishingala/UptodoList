//
//  TodolistDataModel.swift
//  Todolist
//
//  Created by Abhi's Computers on 08/03/24.
//

import Foundation
import UIKit
import CoreData


class TodolistDataModel {
    
    static var Shared = TodolistDataModel()
    
    
    lazy var PersistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Todolist")
        
        container.loadPersistentStores(completionHandler: { (Success, error) in

            if let erro = error {
                print(erro.localizedDescription)
            }
            
        })
        return container
    }()
    
    
    func settaskname (taskname: String)  {
        
        let context = PersistentContainer.viewContext
        let entiti = NSEntityDescription.insertNewObject(forEntityName: "TaskInfo", into: context) as! TaskInfo
        
        entiti.taskname = taskname
        
        do {
            try context.save()
        }catch {
            print("Not a save")
        }
    }
    
    func settasktime (tasktime: String ) {
        
        let context = PersistentContainer.viewContext
        let entiti = NSEntityDescription.insertNewObject(forEntityName: "TaskInfo", into: context) as! TaskInfo
        entiti.tasktime = tasktime
     
        do {
            try context.save()
        }catch {
            print("Not a save")
        }
    }
    
    func settaskcategoryimg (taskcategoryimg: String) {
        
        let context = PersistentContainer.viewContext
        let entiti = NSEntityDescription.insertNewObject(forEntityName: "TaskInfo", into: context) as! TaskInfo
        
        entiti.taskcategoryimg = taskcategoryimg
        do {
            try context.save()
        }catch {
            print("Not a save")
        }
    }
    
    func isTaskCompleted (isTaskCompleted: Bool) {
        
        let context = PersistentContainer.viewContext
        let entiti = NSEntityDescription.insertNewObject(forEntityName: "TaskInfo", into: context) as! TaskInfo
        entiti.isTaskCompleted = isTaskCompleted
        
        do {
            try context.save()
        }catch {
            print("Not a save")
        }
    }
    
    func settaskdate (taskdate: String) {
        let context = PersistentContainer.viewContext
        let entiti = NSEntityDescription.insertNewObject(forEntityName: "TaskInfo", into: context) as! TaskInfo
        entiti.taskdate = taskdate
        
        do {
            try context.save()
        }catch {
            print("Not a save")
        }
    }
    
    
    func getcategary () {
        
    }
    
}
