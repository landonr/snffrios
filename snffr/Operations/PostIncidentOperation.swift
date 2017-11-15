//
//  PostIncidentOperation.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-30.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class PostIncidentOperation: Operation {
    
    fileprivate var completion: (() -> Void)!
    var incident: Incident?

    enum PostIncidentOperationError: Error {
        case busted
    }
    
    init(incident: Incident, completionBlock: @escaping (() -> Void)) {
        self.completion = completionBlock
        self.incident = incident
    }
    
    override func start() {
        postIncident()
    }
    
    func postIncident() {
        if let dict = self.incident?.dictionaryRepresentation() {
            Alamofire.request("http://rezqs.herokuapp.com/api/incidents", method: .post, parameters: dict, encoding: JSONEncoding.default, headers: nil).responseString { (responseString) in
                self.completion()
            }
        }
    }
}

