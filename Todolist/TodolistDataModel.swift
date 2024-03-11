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
    
    
    func settaskname (taskname: String,tasktime: String,taskcategoryimg: String,isTaskCompleted: Bool,taskdate: String)  {
        
        let context = PersistentContainer.viewContext
        let entiti = NSEntityDescription.insertNewObject(forEntityName: "TaskInfo", into: context) as! TaskInfo
        
        entiti.taskname = taskname
        entiti.tasktime = tasktime
        entiti.taskcategoryimg = taskcategoryimg
        entiti.isTaskCompleted = isTaskCompleted
        entiti.taskdate = taskdate

        do {
            try context.save()
        }catch {
            print("Not a save")
        }
    }
    
    func gettaskdata () -> [TaskInfo] {

        
        let context = PersistentContainer.viewContext
        var request = [TaskInfo]()
        
        do {
            request = try context.fetch(TaskInfo.fetchRequest())
            
        }catch {
            print("Data get error")
        }
        return request
    }
    
    
    
}
