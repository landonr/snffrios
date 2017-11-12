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
    
    func dogsForMe() -> [Dog] {
        var dogs = [Dog]()
        if let fosterId = UserViewModel.sharedInstance.activeUser?.userId {
            for dog in self.dogs {
                if dog.careGiverId == fosterId {
                    dogs.append(dog)
                }
            }
        } else {
            return self.dogs
        }
        return dogs
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
