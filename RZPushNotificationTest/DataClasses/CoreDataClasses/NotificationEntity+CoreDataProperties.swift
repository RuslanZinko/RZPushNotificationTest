//
//  NotificationEntity+CoreDataProperties.swift
//  RZPushNotificationTest
//
//  Created by Ruslan Zinko on 1/18/17.
//  Copyright © 2017 Ruslan Zinko. All rights reserved.
//

import Foundation
import CoreData


extension NotificationEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotificationEntity> {
        return NSFetchRequest<NotificationEntity>(entityName: "NotificationEntity");
    }

    @NSManaged public var content: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?

}
