//
//  UpdateUserOperation.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-19.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import Auth0

class UpdateUserOperation: Operation {
    let putFosterOperationGroup = DispatchGroup()
    fileprivate var completion: (() -> Void)!
    var foster: Foster?
    enum UpdateUserOperationError: Error {
        case busted
    }
    
    init(_ foster: Foster, completionBlock: @escaping (() -> Void)) {
        self.foster = foster
        self.completion = completionBlock
    }
    
    override func start() {
        putFosterInfo()
        putFosterOperationGroup.notify(queue: .main) {
            self.putFoster()
        }
    }
    
    func postPhone(phone: Phone, completion: @escaping(() -> Void)) {
        var method = HTTPMethod.post
        var address = "http://rezqs.herokuapp.com/api/phones"
        
        if let phoneId = phone.phoneId {
            address = "http://rezqs.herokuapp.com/api/phones/\(phoneId)"
            method = .put
        }
        
        Alamofire.request(address, method: method, parameters: phone.dictionaryRepresentation()).responseObject {(response: DataResponse<Phone>) in
            if let result = response.result.value {
                self.foster?.phone = result
                self.foster?.phoneId = result.phoneId
                completion()
            }
        }
    }
    
    func postHouse(house: House, completion: @escaping(() -> Void)) {
        var method = HTTPMethod.post
        var address = "http://rezqs.herokuapp.com/api/phones"
        
        if let houseId = house.houseId {
            address = "http://rezqs.herokuapp.com/api/phones/\(houseId)"
            method = .put
        }
        
        Alamofire.request(address, method: method, parameters: house.dictionaryRepresentation()).responseObject {(response: DataResponse<House>) in
            if let result = response.result.value {
                self.foster?.house = result
                self.foster?.houseId = result.houseId
                completion()
            }
        }
    }
    
    func postAddress(address: Address, completion: @escaping(() -> Void)) {
        var method = HTTPMethod.post
        var url = "http://rezqs.herokuapp.com/api/addresses"
        
        if let addressId = address.addressId {
            url = "http://rezqs.herokuapp.com/api/addresses/\(addressId)"
            method = .put
        }
        
        Alamofire.request(url, method: method, parameters: address.dictionaryRepresentation()).responseObject {(response: DataResponse<Address>) in
            if let result = response.result.value {
                self.foster?.address = result
                self.foster?.addressId = result.addressId
                completion()
            }
        }
    }
    
    func putFoster() {
        FosterViewModel.sharedInstance.activeUser = self.foster
        if let userId = self.foster?.userId {
            Alamofire.request("http://rezqs.herokuapp.com/api/users/\(userId)", method: .put, parameters: self.foster?.dictionaryRepresentation()).responseString { (response) in
                self.completion()
            }
        }
    }
    
    func putFosterInfo() {
        if let phone = self.foster?.phone {
            putFosterOperationGroup.enter()
            self.postPhone(phone: phone, completion: {
                self.putFosterOperationGroup.leave()
            })
        }
        if let house = self.foster?.house {
            putFosterOperationGroup.enter()
            self.postHouse(house: house, completion: {
                self.putFosterOperationGroup.leave()
            })
        }
        if let address = self.foster?.address {
            putFosterOperationGroup.enter()
            self.postAddress(address: address, completion: {
                self.putFosterOperationGroup.leave()
            })
        }
    }
}
