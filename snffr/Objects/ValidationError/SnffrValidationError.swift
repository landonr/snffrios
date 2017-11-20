//
//  SnffrValidationError.swift
//
//  Created by Landon Rohatensky on 2017-11-20
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class SnffrValidationError: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let errors = "errors"
    static let name = "name"
    static let statusCode = "statusCode"
    static let message = "message"
    static let error = "error"
  }

  // MARK: Properties
  public var errors: [SnffrErrors]?
  public var name: String?
  public var statusCode: Int?
  public var message: String?
  public var error: String?

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
    errors <- map[SerializationKeys.errors]
    name <- map[SerializationKeys.name]
    statusCode <- map[SerializationKeys.statusCode]
    message <- map[SerializationKeys.message]
    error <- map[SerializationKeys.error]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = errors { dictionary[SerializationKeys.errors] = value.map { $0.dictionaryRepresentation() } }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = statusCode { dictionary[SerializationKeys.statusCode] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = error { dictionary[SerializationKeys.error] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.errors = aDecoder.decodeObject(forKey: SerializationKeys.errors) as? [SnffrErrors]
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.statusCode = aDecoder.decodeObject(forKey: SerializationKeys.statusCode) as? Int
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
    self.error = aDecoder.decodeObject(forKey: SerializationKeys.error) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(errors, forKey: SerializationKeys.errors)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(statusCode, forKey: SerializationKeys.statusCode)
    aCoder.encode(message, forKey: SerializationKeys.message)
    aCoder.encode(error, forKey: SerializationKeys.error)
  }

}
