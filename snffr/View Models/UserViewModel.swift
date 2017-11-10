//
//  UserViewModel.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-04.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Auth0
class UserViewModel: NSObject {
    static let sharedInstance = UserViewModel()
    var users = [Foster]()
    var queue = OperationQueue()
    
    func getUsers() {
        let getUserOperation = GetUserOperation { (users) in
            if let users = users {
                self.users = users
            }
        }
        self.queue.addOperation(getUserOperation)
    }
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.getUsers),
            name: NSNotification.Name(rawValue: "usersDidUpdate"),
            object: nil)
        getUsers()
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
    
    func updateUser(user: UserInfo)
    {
        let postUserOperation = PostUserOperation(user) {
            NotificationCenter.default.post(Notification(name: NSNotification.Name(rawValue: "usersDidUpdate"), object: nil))
        }
        self.queue.addOperation(postUserOperation)
    }
}
