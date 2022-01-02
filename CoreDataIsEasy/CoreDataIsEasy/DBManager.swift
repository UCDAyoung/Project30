//
//  DBManager.swift
//  CoreDataIsEasy
//
//  Created by 박준영 on 9/30/21.
//

import Foundation
import CoreData

class DBManager {
    static let shared = DBManager()
    
    
    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "CoreDataIsEasy")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchMemo() -> [Memo] {
        var memo = [Memo]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Memo.description())
        
        do{
            memo = try context.fetch(fetchRequest) as! [Memo]
        }catch{
            print("error")
        }
        return memo
    }

}
