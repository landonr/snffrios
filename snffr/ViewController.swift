//
//  ViewController.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-27.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import UIKit
import Auth0

class ViewController: UIViewController {
    var firstLoad = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(firstLoad) {
            Auth0
                .webAuth()
                .scope("openid profile")
                .audience("https://patrickullrich.auth0.com/userinfo")
                .start { result in
                    switch result {
                    case .success(let credentials):
                        print("Obtained credentials: \(credentials)")
                        self.getProfile(credentials: credentials)
                    case .failure(let error):
                        print("Failed with \(error)")
                    }
            }
        }
        firstLoad = false
    }
    
    func getProfile(credentials: Auth0.Credentials)
    {
        Auth0
            .authentication()
            .userInfo(withAccessToken: credentials.accessToken!)
            .start { result in
                switch(result) {
                case .success(let profile):
                    self.signUpFirebaseWithCredentials(credentials: profile, password: credentials.accessToken!)
                case .failure(let error):
                    // Handle the error
                    break;
                }
        }
    }
    
    func signUpFirebaseWithCredentials(credentials: Auth0.UserInfo, password: String)
    {
        //hey man
        var name = ""
        var email = "landonroha@gmail.com"
        
        if let namer = credentials.name {
            name = namer
        }
        
        if let emaile = credentials.email {
            email = emaile;
        }
        
//        User.registerUser(withName: name, email: email, password:"password", profilePic: UIImage(named: "send")!) { [weak weakSelf = self] (status) in
//            DispatchQueue.main.async {
////                //weakSelf?.showLoading(state: false)
////                for item in self.inputFields {
////                    item.text = ""
////                }
////              if status == true {
////                  //weakSelf?.pushTomainView()
////                  //weakSelf?.profilePicView.image = UIImage.init(named: "profile pic")
////              } else {
////                    for item in (weakSelf?.waringLabels)! {
////                        item.isHidden = false
////                    }
////              }
//                self.performSegue(withIdentifier: "showChat", sender: self)
//            }
//        }
        
        User.loginUser(withEmail: email, password: "password") { (success) in
            self.performSegue(withIdentifier: "showChat", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

