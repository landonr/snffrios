//
//  DogViewModel.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-30.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
class DogViewModel: NSObject {
    static let sharedInstance = DogViewModel()
    var dogs = [Dog]()
    var queue = OperationQueue()
    
    override init() {
        super.init()
        let getDogOperation = GetDogOperation { (dogs) in
            if let dogs = dogs {
                self.dogs = dogs
            }
        }
        self.queue.addOperation(getDogOperation)
    }
    
    func dogForId(id: String) -> Dog?
    {
        for dog in self.dogs {
            if let dogid = dog.dogId {
                if String(dogid) == id {
                    return dog
                }
            }
        }
        return nil
    }
}

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
            if let dogid = user.userId {
                if String(dogid) == id {
                    return user
                }
            }
        }
        return nil
    }
}

class MedicalInfoViewModel: NSObject {
    static let sharedInstance = MedicalInfoViewModel()
    var medicalInfo = [Medical]()
    var queue = OperationQueue()
    
    override init() {
        super.init()
        let getUserOperation = GetMedicalOperation { (users) in
            if let users = users {
                self.medicalInfo = users
            }
        }
        self.queue.addOperation(getUserOperation)
    }
    
    func userForId(id: String) -> [Medical]?
    {
        var medicals = [Medical]()
        for user in self.medicalInfo {
            if let dogid = user.dogId {
                if String(dogid) == id {
                    medicals.append(user)
                }
            }
        }
        return medicals
    }
}
