//
//  OperationViewModel.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-05.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
class OperationViewModel: NSObject {
    static let sharedInstance = OperationViewModel()
    var queue = OperationQueue()
    
    override init() {
        super.init()
        _ = DogViewModel.sharedInstance
        _ = UserViewModel.sharedInstance
        _ = MedicalInfoViewModel.sharedInstance
        _ = IncidentViewModel.sharedInstance
    }
}
