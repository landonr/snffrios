//
//  Foster.swift
//
//  Created by Landon Rohatensky on 2017-11-18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Foster: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let houseId = "houseId"
    static let dogs = "Dogs"
    static let updatedAt = "updated_at"
    static let lastName = "lastName"
    static let userId = "userId"
    static let phoneId = "phoneId"
    static let phone = "Phone"
    static let addressId = "addressId"
    static let address = "Address"
    static let userTypeId = "userTypeId"
    static let house = "House"
    static let createdAt = "created_at"
    static let version = "version"
    static let firstName = "firstName"
    static let auth0Key = "auth0Key"
  }

  // MARK: Properties
  public var houseId: Int?
  public var dogs: [Any]?
  public var updatedAt: String?
  public var lastName: String?
  public var userId: Int?
  public var phoneId: Int?
  public var phone: Phone?
  public var addressId: Int?
  public var address: Address?
  public var userTypeId: Int?
  public var house: House?
  public var createdAt: String?
  public var version: Int?
  public var firstName: String?
  public var auth0Key: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    houseId <- map[SerializationKeys.houseId]
    dogs <- map[SerializationKeys.dogs]
    updatedAt <- map[SerializationKeys.updatedAt]
    lastName <- map[SerializationKeys.lastName]
    userId <- map[SerializationKeys.userId]
    phoneId <- map[SerializationKeys.phoneId]
    phone <- map[SerializationKeys.phone]
    addressId <- map[SerializationKeys.addressId]
    address <- map[SerializationKeys.address]
    userTypeId <- map[SerializationKeys.userTypeId]
    house <- map[SerializationKeys.house]
    createdAt <- map[SerializationKeys.createdAt]
    version <- map[SerializationKeys.version]
    firstName <- map[SerializationKeys.firstName]
    auth0Key <- map[SerializationKeys.auth0Key]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = houseId { dictionary[SerializationKeys.houseId] = value }
    if let value = lastName { dictionary[SerializationKeys.lastName] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = phoneId { dictionary[SerializationKeys.phoneId] = value }
    //if let value = phone { dictionary[SerializationKeys.phone] = value.dictionaryRepresentation() }
    if let value = addressId { dictionary[SerializationKeys.addressId] = value }
    //if let value = address { dictionary[SerializationKeys.address] = value.dictionaryRepresentation() }
    if let value = userTypeId { dictionary[SerializationKeys.userTypeId] = value }
    //if let value = house { dictionary[SerializationKeys.house] = value.dictionaryRepresentation() }
    if let value = firstName { dictionary[SerializationKeys.firstName] = value }
    if let value = auth0Key { dictionary[SerializationKeys.auth0Key] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.houseId = aDecoder.decodeObject(forKey: SerializationKeys.houseId) as? Int
    self.dogs = aDecoder.decodeObject(forKey: SerializationKeys.dogs) as? [Any]
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.lastName = aDecoder.decodeObject(forKey: SerializationKeys.lastName) as? String
    self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? Int
    self.phoneId = aDecoder.decodeObject(forKey: SerializationKeys.phoneId) as? Int
    self.phone = aDecoder.decodeObject(forKey: SerializationKeys.phone) as? Phone
    self.addressId = aDecoder.decodeObject(forKey: SerializationKeys.addressId) as? Int
    self.address = aDecoder.decodeObject(forKey: SerializationKeys.address) as? Address
    self.userTypeId = aDecoder.decodeObject(forKey: SerializationKeys.userTypeId) as? Int
    self.house = aDecoder.decodeObject(forKey: SerializationKeys.house) as? House
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? Int
    self.firstName = aDecoder.decodeObject(forKey: SerializationKeys.firstName) as? String
    self.auth0Key = aDecoder.decodeObject(forKey: SerializationKeys.auth0Key) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(houseId, forKey: SerializationKeys.houseId)
    aCoder.encode(dogs, forKey: SerializationKeys.dogs)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(lastName, forKey: SerializationKeys.lastName)
    aCoder.encode(userId, forKey: SerializationKeys.userId)
    aCoder.encode(phoneId, forKey: SerializationKeys.phoneId)
    aCoder.encode(phone, forKey: SerializationKeys.phone)
    aCoder.encode(addressId, forKey: SerializationKeys.addressId)
    aCoder.encode(address, forKey: SerializationKeys.address)
    aCoder.encode(userTypeId, forKey: SerializationKeys.userTypeId)
    aCoder.encode(house, forKey: SerializationKeys.house)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(version, forKey: SerializationKeys.version)
    aCoder.encode(firstName, forKey: SerializationKeys.firstName)
    aCoder.encode(auth0Key, forKey: SerializationKeys.auth0Key)
  }

}
