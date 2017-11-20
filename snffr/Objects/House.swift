//
//  House.swift
//
//  Created by Landon Rohatensky on 2017-11-18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class House: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let version = "version"
    static let houseId = "houseId"
    static let updatedAt = "updated_at"
    static let houseTypeId = "houseTypeId"
    static let squareFeet = "squareFeet"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var version: Int?
  public var houseId: Int?
  public var updatedAt: String?
  public var houseTypeId: Int?
  public var squareFeet: Int?
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
    houseId <- map[SerializationKeys.houseId]
    updatedAt <- map[SerializationKeys.updatedAt]
    houseTypeId <- map[SerializationKeys.houseTypeId]
    squareFeet <- map[SerializationKeys.squareFeet]
    createdAt <- map[SerializationKeys.createdAt]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = houseId { dictionary[SerializationKeys.houseId] = value }
    if let value = houseTypeId { dictionary[SerializationKeys.houseTypeId] = value }
    if let value = squareFeet { dictionary[SerializationKeys.squareFeet] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? Int
    self.houseId = aDecoder.decodeObject(forKey: SerializationKeys.houseId) as? Int
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.houseTypeId = aDecoder.decodeObject(forKey: SerializationKeys.houseTypeId) as? Int
    self.squareFeet = aDecoder.decodeObject(forKey: SerializationKeys.squareFeet) as? Int
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(version, forKey: SerializationKeys.version)
    aCoder.encode(houseId, forKey: SerializationKeys.houseId)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(houseTypeId, forKey: SerializationKeys.houseTypeId)
    aCoder.encode(squareFeet, forKey: SerializationKeys.squareFeet)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
  }

}
