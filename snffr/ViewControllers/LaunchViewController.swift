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
        _ = DogViewModel.sharedInstance
        _ = UserViewModel.sharedInstance
        _ = MedicalInfoViewModel.sharedInstance
        _ = IncidentViewModel.sharedInstance
    }
    
    fileprivate func saveAccesstoken(_ token: String?, admin: Bool?) {
        if let userDefaults = UserDefaults(suiteName: "group.tastytreats.snffr.token") {
            userDefaults.set(token, forKey: "token")
            userDefaults.set(admin, forKey: "admin")
            userDefaults.synchronize()
        }
    }
    
    fileprivate func login() {
        if let accessToken = getAccessToken() {
            self.getProfile(accessToken)
        } else {
            Auth0
                .webAuth()
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
                        self.login()
                    }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let accessToken = getAccessToken() {
            self.getProfile(accessToken)
        }
    }
    
    @IBAction func didTapFosterSignup() {
        self.saveAccesstoken(nil, admin: nil)
        login()
    }
    
    @IBAction func didTapAdminSignup() {
        self.saveAccesstoken(nil, admin: nil)
        self.admin = true
        login()
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
                    self.signUpFirebaseWithCredentials(credentials: profile, password: accessToken)
                case .failure( _):
                    self.saveAccesstoken(nil, admin: nil)
                    self.login()
                    // Handle the error
                    break;
                }
        }
    }
    
    public func simpleRegister(email: String, username: String, password: String, completion: @escaping (Bool) -> Swift.Void) {
        let image = UIImage(named: "dog1")!
        User.registerUser(withName: username, email: email, password: password, profilePic: image) { (success) in
            completion(success)
        }
    }
    
    fileprivate func proceedToApp() {
        self.performSegue(withIdentifier: "showChat", sender: self)
    }
    
    func signUpFirebaseWithCredentials(credentials: Auth0.UserInfo, password: String)
    {
        var email = "landonroha@gmail.com"
        var name = "Foster"
        if !self.admin {
            if let cemail = credentials.name {
                email = cemail;
            }
            if let nickname = credentials.nickname {
                name = nickname;
            } else if let nickname = credentials.givenName {
                name = nickname;
            }
        }
        
        User.loginUser(withEmail: email, password: "password") { (success) in
            if success {
                self.performSegue(withIdentifier: "showChat", sender: self)
            } else {
                self.simpleRegister(email: email, username: name, password: "password", completion: { (success) in
                    if success {
                        self.proceedToApp()
                    } else {
                        self.login()
                    }
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
