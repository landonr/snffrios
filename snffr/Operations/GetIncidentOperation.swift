//
//  GetIncidentOperation.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-30.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class GetIncidentOperation: Operation {
    
    fileprivate var completion: (([Incident]?) -> Void)!
    
    enum GetIncidentOperationError: Error {
        case busted
    }
    
    init(completionBlock: @escaping (([Incident]?) -> Void)) {
        self.completion = completionBlock
    }
    
    override func start() {
        getIncidents()
    }
    
    func getIncidents() {
        Alamofire.request("http://rezqs.herokuapp.com/api/incidents").responseArray {(response: DataResponse<[Incident]>) in
            if let result = response.result.value {
                self.completion(result)
            } else {
                self.completion(nil)
            }
        }
    }
}
