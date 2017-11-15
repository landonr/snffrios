//
//  ViewController.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-27.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import UIKit
import Auth0
import Firebase

class LaunchViewController: UIViewController {
    var firstLoad = true
    var accessToken: String?
    var admin = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseApp.configure()
        _ = OperationViewModel()
    }
    
    fileprivate func saveAccesstoken(_ token: String?, admin: Bool?) {
        if let userDefaults = UserDefaults(suiteName: "group.tastytreats.snffr.token") {
            userDefaults.set(token, forKey: "token")
            userDefaults.set(admin, forKey: "admin")
            userDefaults.synchronize()
        }
    }
    
    fileprivate func signUp() {
        if let accessToken = getAccessToken() {
            self.getProfile(accessToken)
        } else {
            Auth0.webAuth()
                .scope("openid profile")
                .audience("https://patrickullrich.auth0.com/userinfo")
                .start { result in
                    switch result {
                    case .success(let credentials):
                        print("Obtained credentials: \(credentials)")
                        if let accessToken = credentials.accessToken {
                            self.accessToken = accessToken
                            self.saveAccesstoken(accessToken, admin: self.admin)
                            self.getProfile(accessToken)
                        }
                    case .failure(let error):
                        print("Failed with \(error)")
                        self.saveAccesstoken(nil, admin: nil)
                        self.signUp()
                    }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func didTapLogin() {
        signUp()
    }
    
    @IBAction func didTapFosterSignup() {
        signUp()
    }
    
    @IBAction func didTapAdminSignup() {
        self.admin = true
        signUp()
    }
    
    fileprivate func getAccessToken() -> String? {
        if let userDefaults = UserDefaults(suiteName: "group.tastytreats.snffr.token") {
            if let decoded  = userDefaults.string(forKey: "token") {
                return decoded
            }
            if let admin = userDefaults.object(forKey: "admin") as? Bool {
                self.admin = admin
            }
        }
        return nil
    }
    
    func getProfile(_ accessToken: String)
    {
        Auth0.authentication()
            .userInfo(withAccessToken: accessToken)
            .start { result in
                switch(result) {
                case .success(let profile):
                    self.loginFirebaseWithCredentials(profile)
                case .failure( _):
                    self.saveAccesstoken(nil, admin: nil)
                    self.signUp()
                    // Handle the error
                    break;
                }
        }
    }
    
    fileprivate func proceedToApp(_ credentials: Auth0.UserInfo) {
        if !self.admin {
            if let foster = FosterViewModel.sharedInstance.userForSub(id: credentials.sub) {
                FosterViewModel.sharedInstance.activeUser = foster
                self.performSegue(withIdentifier: "showChat", sender: self)
            } else {
                FosterViewModel.sharedInstance.updateUser(user: credentials)
                self.performSegue(withIdentifier: "showChat", sender: self)
            }
        } else {
            self.performSegue(withIdentifier: "showChat", sender: self)
        }
    }
    
    fileprivate func loginFirebaseWithCredentials(_ credentials: Auth0.UserInfo) {
        var email = ""
        var password = credentials.sub
        if !self.admin {
            if let cemail = credentials.email {
                email = cemail;
            } else if let name = credentials.givenName {
                email = name + "@snffr.com"
            }
        } else {
            email = "patrickullrich@gmail.com"
            password = "password"
        }
        
        User.loginUser(withEmail: email, password: password) { (success) in
            if success {
                self.proceedToApp(credentials)
            } else {
                self.signUpFirebaseWithCredentials(credentials: credentials)
            }
        }
    }
    
    func signUpFirebaseWithCredentials(credentials: Auth0.UserInfo)
    {
        var email = ""
        var name = "Admin"
        var password = credentials.sub
        if !self.admin {
            if let cemail = credentials.email {
                email = cemail;
            } else if let name = credentials.givenName {
                email = name + "@snffr.com"
            }
            if let nickname = credentials.nickname {
                name = nickname;
            } else if let nickname = credentials.givenName {
                name = nickname;
            }
        } else {
            email = "patrickullrich@gmail.com"
            password = "password"
        }
        
        User.registerUser(withName: name, email: email, password: password, profilePic: #imageLiteral(resourceName: "dog1")) { (success) in
            if success {
                self.proceedToApp(credentials)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
