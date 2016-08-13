//
//  RegisterViewController.swift
//  Panthera
//
//  Created by don't touch me on 8/13/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var regEmailTextField: UITextField!
    @IBOutlet weak var regPassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print(textField)
        
        if textField == self.regEmailTextField {
            print(textField.text)
            
            textField.resignFirstResponder()
            
            self.regPassTextField.becomeFirstResponder()
            
        }
        return true
    }
    
    @IBAction func registerButtonPressed(sender: UIButton) {
        
        if let email = self.regEmailTextField.text {
            
            if let password = self.regPassTextField.text {
                
                self.createUser(email, password: password)
            }
        }
        
    }
    
    func createUser(email: String, password: String) {
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if let user = user {
                print(user.uid)
                print("created success!")
            }
        }
    }

}
