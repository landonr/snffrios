//
//  GetMedicalInfoOperation.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-04.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class GetMedicalInfoOperation: Operation {
    
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
