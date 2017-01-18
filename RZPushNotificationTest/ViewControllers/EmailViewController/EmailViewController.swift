//
//  EmailViewController.swift
//  RZPushNotificationTest
//
//  Created by Ruslan Zinko on 16.01.17.
//  Copyright © 2017 Ruslan Zinko. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: ValidationFunctions
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func valuesValidation() {
        if self.isValidEmail(testStr: emailTextField.text!) == false {
            let alertController = UIAlertController(title: "Error", message: "Please, enter correct E-Mail", preferredStyle:.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Correct", message: "E-Mail is correct", preferredStyle:.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                NSLog("OK Pressed")
                self.presentNextController()
                self.sendTag()
            }
            self.emailTextField.resignFirstResponder()
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func presentNextController () {
        let notificationViewController = self.storyboard!.instantiateViewController(withIdentifier: "NotificationsTableViewController")
        self.navigationController?.pushViewController(notificationViewController, animated: true)
    }
    
    func sendTag() {
        OneSignal.syncHashedEmail(emailTextField.text)
    }
    
    func saveEmailToMemory() {
        EmailManager.sharedInstance.saveEmail(email: emailTextField.text)
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        self.valuesValidation()
        self.saveEmailToMemory()
    }
}
