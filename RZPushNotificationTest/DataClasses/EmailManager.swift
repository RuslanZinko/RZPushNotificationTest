//
//  EmailManager.swift
//  RZPushNotificationTest
//
//  Created by Ruslan Zinko on 17.01.17.
//  Copyright © 2017 Ruslan Zinko. All rights reserved.
//

import UIKit

class EmailManager: NSObject {
    
    static let sharednstance : EmailManager = {
        let instance = EmailManager()
        return instance
    }()
    var emailAddress : String = ""
    
    func saveEmail(email : String!) {

    }
    
}
