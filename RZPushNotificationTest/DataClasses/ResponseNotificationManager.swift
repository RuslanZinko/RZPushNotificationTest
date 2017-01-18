//
//  ResponseNotificationManager.swift
//  RZPushNotificationTest
//
//  Created by Ruslan Zinko on 1/17/17.
//  Copyright © 2017 Ruslan Zinko. All rights reserved.
//

import UIKit
import CoreData

class ResponseNotificationManager: NSObject {

    static let sharedInstance : ResponseNotificationManager = {
        let instance = ResponseNotificationManager()
        return instance
    }()
    
    func getResponseOfNotification(title: String?, subtitle: String?, body: String?) {
        let context = getContext()
        
        let entity =  NSEntityDescription.entity(forEntityName: "NotificationEntity", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        transc.setValue(title, forKey: "title")
        transc.setValue(subtitle, forKey: "subtitle")
        transc.setValue(body, forKey: "content")
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
    
    func getDataFromTheBase() -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<NotificationEntity> = NotificationEntity.fetchRequest()
        
        var result : [NSManagedObject] = []
        do {
            result = try getContext().fetch(fetchRequest)
            print ("num of results = \(result.count)")
            
            for trans in result as [NSManagedObject] {

                print("\(trans.value(forKey: "title"))")
                print("\(trans.value(forKey: "subtitle"))")
                print("\(trans.value(forKey: "content"))")

            }
        } catch {
            print("Error with request: \(error)")
        }
        return result
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}
