//
//  loginViewController.swift
//  Instagram
//
//  Created by Philip Irivng  on 2/26/19.
//  Copyright © 2019 Philip Irivng . All rights reserved.
//

import UIKit
import Parse

class loginViewController: UIViewController {

    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBAction func SignInButton(_ sender: Any) {
        let username = UserNameField.text!
        let password = PasswordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user
            , error) in
            if user != nil{
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        let user = PFUser()
        user.username = UserNameField.text
        user.password = PasswordField.text
        user.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error._code)
            } else {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
