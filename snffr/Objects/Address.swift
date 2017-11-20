//
//  Address.swift
//
//  Created by Landon Rohatensky on 2017-11-18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Address: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
    struct SerializationKeys {
    static let city = "city"
    static let postalCode = "postalCode"
    static let updatedAt = "updated_at"
    static let addressId = "addressId"
    static let createdAt = "created_at"
    static let version = "version"
    static let addressLine1 = "addressLine1"
  }

  // MARK: Properties
  public var city: String?
  public var postalCode: String?
  public var updatedAt: String?
  public var addressId: Int?
  public var createdAt: String?
  public var version: Int?
  public var addressLine1: String?

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
    city <- map[SerializationKeys.city]
    postalCode <- map[SerializationKeys.postalCode]
    updatedAt <- map[SerializationKeys.updatedAt]
    addressId <- map[SerializationKeys.addressId]
    createdAt <- map[SerializationKeys.createdAt]
    version <- map[SerializationKeys.version]
    addressLine1 <- map[SerializationKeys.addressLine1]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = city { dictionary[SerializationKeys.city] = value }
    if let value = postalCode { dictionary[SerializationKeys.postalCode] = value }
    if let value = addressId { dictionary[SerializationKeys.addressId] = value }
    if let value = addressLine1 { dictionary[SerializationKeys.addressLine1] = value }
    return dictionary
  }
    
    public init() {
        
    }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.city = aDecoder.decodeObject(forKey: SerializationKeys.city) as? String
    self.postalCode = aDecoder.decodeObject(forKey: SerializationKeys.postalCode) as? String
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.addressId = aDecoder.decodeObject(forKey: SerializationKeys.addressId) as? Int
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? Int
    self.addressLine1 = aDecoder.decodeObject(forKey: SerializationKeys.addressLine1) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(city, forKey: SerializationKeys.city)
    aCoder.encode(postalCode, forKey: SerializationKeys.postalCode)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(addressId, forKey: SerializationKeys.addressId)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(version, forKey: SerializationKeys.version)
    aCoder.encode(addressLine1, forKey: SerializationKeys.addressLine1)
  }

}
