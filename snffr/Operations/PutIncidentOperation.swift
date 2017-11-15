//
//  PutIncidentOperation.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-14.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class PutIncidentOperation: Operation {
    
    fileprivate var completion: (() -> Void)!
    var incident: Incident?
    
    enum PutIncidentOperationError: Error {
        case busted
    }
    
    init(incident: Incident, completionBlock: @escaping (() -> Void)) {
        self.completion = completionBlock
        self.incident = incident
    }
    
    override func start() {
        updateIncident()
    }
    
    func updateIncident() {
        if let incidentId = self.incident?.incidentId,
            let dict = self.incident?.dictionaryRepresentation() {
            Alamofire.request("http://rezqs.herokuapp.com/api/incidents/\(incidentId)", method: .put, parameters: dict, encoding: JSONEncoding.default, headers: nil).responseString { (responseString) in
                self.completion()
            }
        }
    }
}

