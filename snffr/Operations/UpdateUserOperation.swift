//
//  UpdateUserOperation.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-19.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import Auth0

class UpdateUserOperation: Operation {
    
    fileprivate var completion: (() -> Void)!
    var foster: Foster?
    enum UpdateUserOperationError: Error {
        case busted
    }
    
    init(_ foster: Foster, completionBlock: @escaping (() -> Void)) {
        self.foster = foster
        self.completion = completionBlock
    }
    
    override func start() {
        putFoster()
    }
    
    func postPhone(phone: Phone) {
        var method = HTTPMethod.post
        var address = "http://rezqs.herokuapp.com/api/phones"
        
        if let phoneId = phone.phoneId {
            address = "http://rezqs.herokuapp.com/api/phones/\(phoneId)"
            method = .put
        }
        
        Alamofire.request(address, method: method, parameters: phone.dictionaryRepresentation()).responseString { (response) in
            
        }
    }
    
    func putFoster() {
        FosterViewModel.sharedInstance.activeUser = self.foster
        if let phone = self.foster?.phone {
            self.postPhone(phone: phone)
        }
        if let userId = self.foster?.userId {
            Alamofire.request("http://rezqs.herokuapp.com/api/users/\(userId)", method: .put, parameters: self.foster?.dictionaryRepresentation()).responseString { (response) in
                self.completion()
            }
        }
    }
}
