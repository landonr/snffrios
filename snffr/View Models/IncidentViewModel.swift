//
//  IncidentViewModel.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-04.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire

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
    
    func incidentsForMe() -> [Incident] {
        var dogIncidents = [Incident]()
        
        if let _ = FosterViewModel.sharedInstance.activeUser?.userId {
            let myDogs = DogViewModel.sharedInstance.dogsForMe()
            for incident in self.incidents {
                for dog in myDogs {
                    if let incidentId = incident.dogId {
                        if incidentId == dog.dogId {
                            dogIncidents.append(incident)
                        }
                    }
                }
            }
        } else {
            dogIncidents.append(contentsOf: self.incidents)
        }
        return dogIncidents
    }
    
    func postNewIncident(_ newIncident: Incident) {
        let postIncidentOperation = PostIncidentOperation(incident: newIncident) { () in
            self.getIncidents()
        }
        self.queue.addOperation(postIncidentOperation)
    }
    
    func updateIncident(_ incident: Incident) {
        let updateIncidentOperation = PutIncidentOperation(incident: incident) { () in
            self.getIncidents()
        }
        self.queue.addOperation(updateIncidentOperation)
    }
    
    func getIncidents() {
        let getIncidentOperation = GetIncidentOperation() { (response) in
            if let incidents = response {
                self.incidents = incidents
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newIncident"), object: nil, userInfo: nil)
            }
        }
        
        self.queue.addOperation(getIncidentOperation)
    }
    
    override init() {
        super.init()
        self.getIncidents()
    }
}
