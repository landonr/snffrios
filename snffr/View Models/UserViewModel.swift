//
//  UserViewModel.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-04.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation

class UserViewModel: NSObject {
    static let sharedInstance = UserViewModel()
    var users = [Foster]()
    var queue = OperationQueue()
    
    override init() {
        super.init()
        let getUserOperation = GetUserOperation { (users) in
            if let users = users {
                self.users = users
            }
        }
        self.queue.addOperation(getUserOperation)
    }
    
    func userForId(id: String) -> Foster?
    {
        for user in self.users {
            if let userid = user.userId {
                if String(userid) == id {
                    return user
                }
            }
        }
        return nil
    }
}
