//
//  IncidentViewModel.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-04.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation

class IncidentViewModel: NSObject {
    static let sharedInstance = IncidentViewModel()
    var incidents = [Incident]()
    var queue = OperationQueue()
    
    func incidentsForDog(_ dogId: Int) -> [Incident] {
        var dogIncidents = [Incident]()
        for incident in self.incidents {
            if let incidentId = incident.dogId {
                if incidentId == dogId {
                    dogIncidents.append(incident)
                }
            }
        }
        return dogIncidents
    }
    
    override init() {
        super.init()

        let getIncidentOperation = GetIncidentOperation() { (response) in
            if let incidents = response {
                self.incidents = incidents
            }
        }
        
        self.queue.addOperation(getIncidentOperation)
    }
}
