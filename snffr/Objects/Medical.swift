//
//  Medical.swift
//
//  Created by Landon Rohatensky on 2017-09-30
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
public class Medical: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let updatedAt = "updated_at"
    static let dogId = "dogId"
    static let createdAt = "created_at"
    static let info = "info"
    static let version = "version"
    static let medicalInfoId = "medicalInfoId"
    static let medicalInfoTypeId = "medicalInfoTypeId"
  }

  // MARK: Properties
  public var updatedAt: String?
  public var dogId: Int?
  public var createdAt: String?
  public var info: String?
  public var version: Int?
  public var medicalInfoId: Int?
  public var medicalInfoTypeId: Int?

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
    dogId <- map[SerializationKeys.dogId]
    createdAt <- map[SerializationKeys.createdAt]
    info <- map[SerializationKeys.info]
    version <- map[SerializationKeys.version]
    medicalInfoId <- map[SerializationKeys.medicalInfoId]
    medicalInfoTypeId <- map[SerializationKeys.medicalInfoTypeId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = dogId { dictionary[SerializationKeys.dogId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = info { dictionary[SerializationKeys.info] = value }
    if let value = version { dictionary[SerializationKeys.version] = value }
    if let value = medicalInfoId { dictionary[SerializationKeys.medicalInfoId] = value }
    if let value = medicalInfoTypeId { dictionary[SerializationKeys.medicalInfoTypeId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.dogId = aDecoder.decodeObject(forKey: SerializationKeys.dogId) as? Int
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.info = aDecoder.decodeObject(forKey: SerializationKeys.info) as? String
    self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? Int
    self.medicalInfoId = aDecoder.decodeObject(forKey: SerializationKeys.medicalInfoId) as? Int
    self.medicalInfoTypeId = aDecoder.decodeObject(forKey: SerializationKeys.medicalInfoTypeId) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(dogId, forKey: SerializationKeys.dogId)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(info, forKey: SerializationKeys.info)
    aCoder.encode(version, forKey: SerializationKeys.version)
    aCoder.encode(medicalInfoId, forKey: SerializationKeys.medicalInfoId)
    aCoder.encode(medicalInfoTypeId, forKey: SerializationKeys.medicalInfoTypeId)
  }

}
