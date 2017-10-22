//
//  Incident.swift
//
//  Created by Landon Rohatensky on 2017-09-30
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
public class Incident: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let updatedAt = "updated_at"
    static let dogId = "dogId"
    static let requestingPartyId = "requestingPartyId"
    static let incidentTypeId = "incidentTypeId"
    static let incidentStatusId = "incidentStatusId"
    static let createdAt = "created_at"
    static let version = "version"
    static let message = "message"
    static let incidentId = "incidentId"
  }

  // MARK: Properties
  public var updatedAt: String?
  public var dogId: Int?
  public var requestingPartyId: Int?
  public var incidentTypeId: Int?
  public var incidentStatusId: Int?
  public var createdAt: String?
  public var version: Int?
  public var message: String?
  public var incidentId: Int?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }
    
    public init(message: String) {
        self.message = message
    }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    updatedAt <- map[SerializationKeys.updatedAt]
    dogId <- map[SerializationKeys.dogId]
    requestingPartyId <- map[SerializationKeys.requestingPartyId]
    incidentTypeId <- map[SerializationKeys.incidentTypeId]
    incidentStatusId <- map[SerializationKeys.incidentStatusId]
    createdAt <- map[SerializationKeys.createdAt]
    version <- map[SerializationKeys.version]
    message <- map[SerializationKeys.message]
    incidentId <- map[SerializationKeys.incidentId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = dogId { dictionary[SerializationKeys.dogId] = value }
    if let value = requestingPartyId { dictionary[SerializationKeys.requestingPartyId] = value }
    if let value = incidentTypeId { dictionary[SerializationKeys.incidentTypeId] = value }
    if let value = incidentStatusId { dictionary[SerializationKeys.incidentStatusId] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = version { dictionary[SerializationKeys.version] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = incidentId { dictionary[SerializationKeys.incidentId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.dogId = aDecoder.decodeObject(forKey: SerializationKeys.dogId) as? Int
    self.requestingPartyId = aDecoder.decodeObject(forKey: SerializationKeys.requestingPartyId) as? Int
    self.incidentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.incidentTypeId) as? Int
    self.incidentStatusId = aDecoder.decodeObject(forKey: SerializationKeys.incidentStatusId) as? Int
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? Int
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
    self.incidentId = aDecoder.decodeObject(forKey: SerializationKeys.incidentId) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(dogId, forKey: SerializationKeys.dogId)
    aCoder.encode(requestingPartyId, forKey: SerializationKeys.requestingPartyId)
    aCoder.encode(incidentTypeId, forKey: SerializationKeys.incidentTypeId)
    aCoder.encode(incidentStatusId, forKey: SerializationKeys.incidentStatusId)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(version, forKey: SerializationKeys.version)
    aCoder.encode(message, forKey: SerializationKeys.message)
    aCoder.encode(incidentId, forKey: SerializationKeys.incidentId)
  }

}
