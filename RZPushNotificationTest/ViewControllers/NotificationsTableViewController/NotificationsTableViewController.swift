//
//  NotificationsTableViewController.swift
//  RZPushNotificationTest
//
//  Created by Ruslan Zinko on 17.01.17.
//  Copyright © 2017 Ruslan Zinko. All rights reserved.
//

import UIKit
import CoreData

class NotificationsTableViewController: UITableViewController {
    
    var notificationsData : [NotificationEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.refreshTableViewData()
    }

    func refreshTableViewData() {
        notificationsData = ResponseNotificationManager.sharedInstance.getDataFromTheBase() as! [NotificationEntity]
        tableView.reloadData()
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        setEditing(true, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationsData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NotificationCell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationCell
        
        let currentNotification = notificationsData[indexPath.row]

        cell.titleLabel.text = currentNotification.value(forKey: "title") as? String
        cell.subtitleLabel.text = currentNotification.value(forKey: "subtitle") as? String
        cell.contentLabel.text = currentNotification.value(forKey: "content") as? String

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            
            let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let context:NSManagedObjectContext = appDel.getContext()
            context.delete(self.notificationsData[indexPath.row] as NSManagedObject)
            self.notificationsData.remove(at: indexPath.row)
           
            do {
                try context.save()
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
         }
         
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.right)

            print("Delete tapped")
        })
        deleteAction.backgroundColor = UIColor.red
        
        return [deleteAction]
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NotificationCell.correctHeightForCell(entity: notificationsData[indexPath.row])
    }

}

