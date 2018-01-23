//
//  ViewController.swift
//  Facebook
//
//  Created by Özcan AKKOCA on 11.09.2017.
//  Copyright © 2017 Özcan AKKOCA. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFacebookButtons()
        
        
    }
    
    
    fileprivate func setupFacebookButtons() {
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["email", "public_profile"]
        
        view.addSubview(loginButton)
        
        //frames are obsolete
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
        loginButton.delegate = self
        
        
        //custom FB login button
        let customFBButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Custom FB Button", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.backgroundColor = .blue
            button.setTitleColor(.white, for: .normal)
            button.frame = CGRect(x: 16, y: 116, width: view.frame.width - 32, height: 50)
            return button
        }()
        
        view.addSubview(customFBButton)
        
        customFBButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
    }
    
    func handleCustomFBLogin() {
        print(123)
        
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) { (result, err) in
            
            if err != nil {
                print("FB login failed: \(err)")
                return
            }
            self.showEmailAddress()
            
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("did log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        showEmailAddress()
    }
    
    
    func showEmailAddress() {
        
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return }
        
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "email, id, name"]).start { (connection, result, err) in
            
            if err != nil {
                print("failed to login: \(err)")
                return
            }
            
            print(result ?? "")
        }
    }
    
    
}

