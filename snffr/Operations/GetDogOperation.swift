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
import CoreLocation
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
        
//        Alamofire.request("http://rezqs.herokuapp.com/api/dogs").responseString(completionHandler: { (result) in
//            print(result.result.value)
//        })
    }
}

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
        
        //        Alamofire.request("http://rezqs.herokuapp.com/api/dogs").responseString(completionHandler: { (result) in
        //            print(result.result.value)
        //        })
    }
}

class GetMedicalOperation: Operation {
    
    fileprivate var completion: (([Medical]?) -> Void)!
    
    enum GetMedicalOperationError: Error {
        case busted
    }
    
    init(completionBlock: @escaping (([Medical]?) -> Void)) {
        self.completion = completionBlock
    }
    
    override func start() {
        getMedical()
    }
    
    func getMedical() {
        Alamofire.request("http://rezqs.herokuapp.com/api/medical_infos").responseArray {(response: DataResponse<[Medical]>) in
            if let result = response.result.value {
                self.completion(result)
            } else {
                self.completion(nil)
            }
        }
    }
}
