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
    
    var notificationsData : [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        notificationsData = ResponseNotificationManager.sharedInstance.getDataFromTheBase()

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
 
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
//    {
//        return true
//    }
//
//    
//     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.delete {
//            tableView.beginUpdates()
//            notificationsData.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.right)
//            tableView.endUpdates()
//        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
