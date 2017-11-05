//
//  GetUserOperation.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-04.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class GetUserOperation: Operation {
    
    fileprivate var completion: (([Foster]?) -> Void)!
    
    enum GetUserOperationError: Error {
        case busted
    }
    
    init(completionBlock: @escaping (([Foster]?) -> Void)) {
        self.completion = completionBlock
    }
    
    override func start() {
        getUsers()
    }
    
    func getUsers() {
        Alamofire.request("http://rezqs.herokuapp.com/api/users").responseArray {(response: DataResponse<[Foster]>) in
            if let result = response.result.value {
                self.completion(result)
            } else {
                self.completion(nil)
            }
        }
    }
}
