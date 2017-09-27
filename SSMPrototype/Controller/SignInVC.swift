//
//  ViewController.swift
//  SSMPrototype
//
//  Created by Elliot on 9/21/17.
//  Copyright © 2017 Elliot. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import SwiftKeychainWrapper


class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: TxtField!
    @IBOutlet weak var pwdField: TxtField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            print("SSMPT: ID found in keychain")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
        
    }

    @IBAction func FacebookBtnTap(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if  error != nil {
                print("SSMPT: Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("SSMPT: User cancelled Facebook Authentication")
                
            } else {
                print("SSMPT: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("SSMPT: Unable to authenticate with Firebase - \(String(describing: error))")
            } else {
                print("SSMPT: Successfully authenticated with Firebase")
                if let user = user {
                    self.completeSignIn(id: user.uid)
            
                }
            }
            
            
            } )
        
        }
    @IBAction func signInTap(_ sender: AnyObject) {
        if let email = emailField.text, let pwd = pwdField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("SSMPT: Email user authenticated with Firebase")
                    if let user = user {
                        self.completeSignIn(id: user.uid)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("SSMTP: Unable to Authorize with Firebase using email")
                        } else {
                            print("SSMPT: successfully authenticated with Firebase")
                            if let user = user {
                                self.completeSignIn(id: user.uid)
                                
                            }
                           
                        }
                        
                    })
                }
                
                
            })
        }
    }
    
    
    func completeSignIn(id: String) {
       let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("SSMPT: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
    
    
}



