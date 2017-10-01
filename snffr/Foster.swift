//
//  User.swift
//
//  Created by Landon Rohatensky on 2017-09-30
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
public class Foster: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let updatedAt = "updated_at"
    static let addressId = "addressId"
    static let userTypeId = "userTypeId"
    static let createdAt = "created_at"
    static let lastName = "lastName"
    static let version = "version"
    static let userId = "userId"
    static let firstName = "firstName"
    static let phoneId = "phoneId"
  }

  // MARK: Properties
  public var updatedAt: String?
  public var addressId: String?
  public var userTypeId: Int?
  public var createdAt: String?
  public var lastName: String?
  public var version: Int?
  public var userId: Int?
  public var firstName: String?
  public var phoneId: String?

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
    updatedAt <- map[SerializationKeys.updatedAt]
    addressId <- map[SerializationKeys.addressId]
    userTypeId <- map[SerializationKeys.userTypeId]
    createdAt <- map[SerializationKeys.createdAt]
    lastName <- map[SerializationKeys.lastName]
    version <- map[SerializationKeys.version]
    userId <- map[SerializationKeys.userId]
    firstName <- map[SerializationKeys.firstName]
    phoneId <- map[SerializationKeys.phoneId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = addressId { dictionary[SerializationKeys.addressId] = value }
    if let value = userTypeId { dictionary[SerializationKeys.userTypeId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = lastName { dictionary[SerializationKeys.lastName] = value }
    if let value = version { dictionary[SerializationKeys.version] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = firstName { dictionary[SerializationKeys.firstName] = value }
    if let value = phoneId { dictionary[SerializationKeys.phoneId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.addressId = aDecoder.decodeObject(forKey: SerializationKeys.addressId) as? String
    self.userTypeId = aDecoder.decodeObject(forKey: SerializationKeys.userTypeId) as? Int
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.lastName = aDecoder.decodeObject(forKey: SerializationKeys.lastName) as? String
    self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? Int
    self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? Int
    self.firstName = aDecoder.decodeObject(forKey: SerializationKeys.firstName) as? String
    self.phoneId = aDecoder.decodeObject(forKey: SerializationKeys.phoneId) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(addressId, forKey: SerializationKeys.addressId)
    aCoder.encode(userTypeId, forKey: SerializationKeys.userTypeId)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(lastName, forKey: SerializationKeys.lastName)
    aCoder.encode(version, forKey: SerializationKeys.version)
    aCoder.encode(userId, forKey: SerializationKeys.userId)
    aCoder.encode(firstName, forKey: SerializationKeys.firstName)
    aCoder.encode(phoneId, forKey: SerializationKeys.phoneId)
  }

}
