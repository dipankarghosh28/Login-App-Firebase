//
//  LoginViewController.swift
//  Dealer
//
//  Created by Dipankar Ghosh on 5/11/18.
//  Copyright © 2018 Dipankar Ghosh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var UserText: UITextField!
    
    @IBOutlet weak var PasswordText: UITextField!
    
  
    @IBOutlet weak var Display: UITextField!
   
    @IBAction func CreateUser(_ sender: Any) {
        if let email = self.UserText.text, let password = self.PasswordText.text {
            // [START headless_email_auth]
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                // [START_EXCLUDE]
                
                if let error = error {
                    print(error.localizedDescription)
                    //show alert
                    return
                }
                else{
                    print("success");
                    // [END_EXCLUDE]
                }
                // [END headless_email_auth]
            }
        }
        
    }
   
    
    @IBAction func Login(_ sender: Any) {
        //To create account we write code here..
       let username = UserText.text //username is being taken in.
       let password = PasswordText.text //password is being taken in.
        
        if(username == "" || password == "")
        {
            return
        }
      //  login(username!, _psw: password!)
loginuser(sender: UserText)
    }
    
    func loginuser(sender: AnyObject)
    {
        if let email = self.UserText.text, let password = self.PasswordText.text
        {
            // [START headless_email_auth]
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                // [START_EXCLUDE]
                
                if let error = error {
                    print(error.localizedDescription)
                    //show alert
                    return
                }
                else{
                    print("success");
            
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    
                  let NextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! NextViewController
                    self.present(NextViewController, animated:true, completion:nil)
                
                }
            }
        }
        else {
            print("email/password can't be empty");
            //show alert
        }
    }
    
  /*
    func login(_ user:String, _psw:String)
    {
       //To login write code here...
        if((UserText.text?.contains("Dipankar"))! && (PasswordText.text?.contains("123"))!)
        {
            NSLog("Logged in")
            Display.text = "Logged In"
        }
        else
        {
            NSLog("Login Failed")
            Display.text = "Not Logged In"
        }
    }
 */
    @IBAction func Return(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray

        // Do any additional setup after loading the view.
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
