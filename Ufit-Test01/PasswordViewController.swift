//
//  PasswordViewController.swift
//  Ufit-Test01
//
//  Created by Yuri on 2/28/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    // Outlet - Password, Confirm Password, Save Password button
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var savePasswordButton: UIButton!
    
    // Outlet - Debug Label
    @IBOutlet weak var debugLabel: UILabel!
    
    var passwordString: String? = ""
    var confirmString: String? = ""
    
    // Action - Set limit on password length to 4 symbols
    @IBAction func passwordDidChanged(_ sender: UITextField) {
            passwordString = newPasswordField.text!
        let passwordLenght = passwordString?.characters.count
        
        if passwordLenght! > 4 {
            let endIndex = passwordString?.index((passwordString?.startIndex)!, offsetBy:4)
            passwordString = passwordString?.substring(to: endIndex!)
            newPasswordField.text = passwordString
            //----- Check print -------
            print("Password:")
            print(passwordString!)
            //-------------------------
            
        }
        //print(passwordLenght!)
 
    }
    
    // Action - Set limit on confirm length to 4 symbols
    @IBAction func confirmDidChanged(_ sender: UITextField) {
        confirmString = confirmPasswordField.text!
        let confirmLenght = confirmString?.characters.count
        
        if confirmLenght! > 4 {
            let endIndex = confirmString?.index((confirmString?.startIndex)!, offsetBy:4)
            confirmString = confirmString?.substring(to: endIndex!)
            confirmPasswordField.text = confirmString
            //----- Check print -------
            print("Confirm password:")
            print(confirmString!)
            //-------------------------

        }
        //print(confirmLenght!)
        
    }
    
    // Action - Save Password button
    @IBAction func savePassword(_ sender: UIButton) {
        // Check if password length is appropriate and confirm matches the password
        var debugMessage: String = ""
        if (passwordString?.characters.count == 4 && passwordString == confirmString) {
        debugMessage += "New Password: " + self.newPasswordField.text! + "\n"
        debugMessage += "Confirm Password: " + self.confirmPasswordField.text!
            
        }
        else {
            debugMessage = "Password doesn't match" + "\n" + "or not appropriate password length!"
            print("Password doesn't match or not appropriate password length!")
        }
        self.debugLabel.text = debugMessage
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // set text field delegate
        self.newPasswordField.delegate = self
        self.confirmPasswordField.delegate = self
        
        // Init toolbar
        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
        
        // Create left side empty space so that 'Done' button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:.flexibleSpace, target: nil, action: nil)
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style:.done, target: self, action: #selector(PasswordViewController.doneButtonAction))
        
        // Array of BarButtonItems
        var array = [UIBarButtonItem]()
        array.append(flexSpace)
        array.append(doneButton)
        
        toolbar.setItems(array, animated: false)
        toolbar.sizeToFit()
        
        // Set toolbar as inputAccessoryView
        self.newPasswordField.inputAccessoryView = toolbar
        self.confirmPasswordField.inputAccessoryView = toolbar
        
    }
    
    func doneButtonAction() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Popover delegate methods
extension PasswordViewController: UIPopoverPresentationControllerDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segPasswordHint" {
            let popoverViewController = segue.destination
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverViewController.popoverPresentationController!.delegate = self
            
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
        
    }
    
}

// MARK: - Textfield delegate methods
extension PasswordViewController: UITextFieldDelegate {
    
    // Move cursor to next text field when clicked return button,
    // close the keyboard when last text field done.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Resign responder from given text field
        textField.resignFirstResponder()
        // Set responder to next text field
        if textField == newPasswordField {
            self.confirmPasswordField.becomeFirstResponder()
            
        }
        return false
    }
    // Close keyboard upon touching the view anywhere.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // End editing mode for the view
        self.view.endEditing(true)
    }
    
}






