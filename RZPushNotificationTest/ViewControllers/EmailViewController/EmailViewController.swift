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
    var emailAddress: String = ""
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ValidationFunctions
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func valuesValidation() {
        emailAddress = emailTextField.text!
        
        if self.isValidEmail(testStr: emailAddress) == false {
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
                let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "notificationsTableViewController")
                let navController = UINavigationController(rootViewController: VC1)
                self.present(navController, animated:true, completion: nil)
            }
            self.emailTextField.resignFirstResponder()
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    //MARK: UITextFieldDelegate
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == nil {
            emailAddress = emailTextField.text!
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.emailTextField.resignFirstResponder()
    }

    @IBAction func continueButtonPressed(_ sender: Any) {
        self.valuesValidation()
    }
}
