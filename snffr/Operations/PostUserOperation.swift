//
//  PostUserOperation.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-05.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import Auth0

class PostUserOperation: Operation {
    
    fileprivate var completion: (() -> Void)!
    var userInfo: UserInfo?
    enum PostUserOperationError: Error {
        case busted
    }
    
    init(_ userInfo: UserInfo, completionBlock: @escaping (() -> Void)) {
        self.userInfo = userInfo
        self.completion = completionBlock
    }
    
    override func start() {
        postUser()
    }
    
    func postUser() {
        let foster = Foster(JSONString: "{\"userId\":1,\"auth0Key\":null,\"firstName\":\"Jon\",\"lastName\":\"Doe\",\"userTypeId\":1,\"addressId\":null,\"phoneId\":null,\"houseId\":null,\"created_at\":null,\"updated_at\":null,\"version\":0}")
        
        if let firstName = userInfo?.givenName {
            foster?.firstName = firstName
        } else if let nickname = userInfo?.nickname {
            foster?.firstName = nickname
        }
        if let familyName = userInfo?.familyName {
            foster?.lastName = familyName
        }
        if let authKey = userInfo?.sub {
            foster?.auth0Key = authKey
        }
        FosterViewModel.sharedInstance.activeUser = foster
        Alamofire.request("http://rezqs.herokuapp.com/api/users", method: .post, parameters: foster?.dictionaryRepresentation()).response { (response) in
            self.completion()
        }
    }
}
