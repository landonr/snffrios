//
//  Phone.swift
//
//  Created by Landon Rohatensky on 2017-11-18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Phone: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let version = "version"
    static let updatedAt = "updated_at"
    static let phoneNumber = "phoneNumber"
    static let phoneId = "phoneId"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var version: Int?
  public var updatedAt: String?
  public var phoneNumber: String?
  public var phoneId: Int?
  public var createdAt: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }
    
    public init() {
        
    }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    version <- map[SerializationKeys.version]
    updatedAt <- map[SerializationKeys.updatedAt]
    phoneNumber <- map[SerializationKeys.phoneNumber]
    phoneId <- map[SerializationKeys.phoneId]
    createdAt <- map[SerializationKeys.createdAt]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = version { dictionary[SerializationKeys.version] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = phoneNumber { dictionary[SerializationKeys.phoneNumber] = value }
    if let value = phoneId { dictionary[SerializationKeys.phoneId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? Int
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.phoneNumber = aDecoder.decodeObject(forKey: SerializationKeys.phoneNumber) as? String
    self.phoneId = aDecoder.decodeObject(forKey: SerializationKeys.phoneId) as? Int
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(version, forKey: SerializationKeys.version)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(phoneNumber, forKey: SerializationKeys.phoneNumber)
    aCoder.encode(phoneId, forKey: SerializationKeys.phoneId)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
  }

}
