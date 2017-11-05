//
//  MedicalInfoViewModel.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-04.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation

class MedicalInfoViewModel: NSObject {
    static let sharedInstance = MedicalInfoViewModel()
    var medicalInfo = [Medical]()
    var queue = OperationQueue()
    
    override init() {
        super.init()
        let getMedicalInfoOperation = GetMedicalInfoOperation { (medicalInfos) in
            if let medicalInfos = medicalInfos {
                self.medicalInfo = medicalInfos
            }
        }
        self.queue.addOperation(getMedicalInfoOperation)
    }
    
    func medicalForUser(id: String) -> [Medical]?
    {
        var medicals = [Medical]()
        for medicalInfo in self.medicalInfo {
            if let medicalInfoId = medicalInfo.dogId {
                if String(medicalInfoId) == id {
                    medicals.append(medicalInfo)
                }
            }
        }
        return medicals
    }
    
    func medicalsForInfoTypeIdAndDogId(_ id: Int, dogId: Int) -> [Medical]
    {
        var meds = [Medical]()

        for med in self.medicalInfo {
            if med.medicalInfoTypeId! == id && med.dogId == dogId {
                meds.append(med)
            }
        }
        return meds
    }
}
