//
//  GetDogOperation.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-30.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class GetDogOperation: Operation {
    
    fileprivate var completion: (([Dog]?) -> Void)!
    
    enum GetDogOperationError: Error {
        case busted
    }
    
    init(completionBlock: @escaping (([Dog]?) -> Void)) {
        self.completion = completionBlock
    }
    
    override func start() {
        getDogs()
    }
    
    func getDogs() {
        Alamofire.request("http://rezqs.herokuapp.com/api/dogs").responseArray {(response: DataResponse<[Dog]>) in
            if let result = response.result.value {
                self.completion(result)
            } else {
                self.completion(nil)
            }
        }
    }
}
