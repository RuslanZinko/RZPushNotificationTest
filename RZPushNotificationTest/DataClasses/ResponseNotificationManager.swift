//
//  ResponseNotificationManager.swift
//  RZPushNotificationTest
//
//  Created by Ruslan Zinko on 1/17/17.
//  Copyright © 2017 Ruslan Zinko. All rights reserved.
//

import UIKit

class ResponseNotificationManager: NSObject {

    static let sharedInstance : ResponseNotificationManager = {
        let instance = ResponseNotificationManager()
        return instance
    }()
    
    func getResponseOfNotification(title: String, subtitle: String, body: String) {
    //    let context = getContext()

    }
    
}
