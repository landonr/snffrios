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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Auth0
            .webAuth()
            .audience("https://patrickullrich.auth0.com/userinfo")
            .start { result in
                switch result {
                case .success(let credentials):
                    print("Obtained credentials: \(credentials)")
                case .failure(let error):
                    print("Failed with \(error)")
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

