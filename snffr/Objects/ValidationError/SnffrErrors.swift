//
//  SnffrErrors.swift
//
//  Created by Landon Rohatensky on 2017-11-20
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class SnffrErrors: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let origin = "origin"
    static let path = "path"
    static let instance = "instance"
    static let value = "value"
    static let validatorArgs = "validatorArgs"
    static let validatorName = "validatorName"
    static let raw = "__raw"
    static let message = "message"
    static let type = "type"
    static let validatorKey = "validatorKey"
  }

  // MARK: Properties
  public var origin: String?
  public var path: String?
  public var instance: SnffrInstance?
  public var value: String?
  public var validatorArgs: [SnffrValidatorArgs]?
  public var validatorName: String?
  public var raw: SnffrRaw?
  public var message: String?
  public var type: String?
  public var validatorKey: String?

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
    origin <- map[SerializationKeys.origin]
    path <- map[SerializationKeys.path]
    instance <- map[SerializationKeys.instance]
    value <- map[SerializationKeys.value]
    validatorArgs <- map[SerializationKeys.validatorArgs]
    validatorName <- map[SerializationKeys.validatorName]
    raw <- map[SerializationKeys.raw]
    message <- map[SerializationKeys.message]
    type <- map[SerializationKeys.type]
    validatorKey <- map[SerializationKeys.validatorKey]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = origin { dictionary[SerializationKeys.origin] = value }
    if let value = path { dictionary[SerializationKeys.path] = value }
    if let value = instance { dictionary[SerializationKeys.instance] = value.dictionaryRepresentation() }
    if let value = value { dictionary[SerializationKeys.value] = value }
    if let value = validatorArgs { dictionary[SerializationKeys.validatorArgs] = value.map { $0.dictionaryRepresentation() } }
    if let value = validatorName { dictionary[SerializationKeys.validatorName] = value }
    if let value = raw { dictionary[SerializationKeys.raw] = value.dictionaryRepresentation() }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = validatorKey { dictionary[SerializationKeys.validatorKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.origin = aDecoder.decodeObject(forKey: SerializationKeys.origin) as? String
    self.path = aDecoder.decodeObject(forKey: SerializationKeys.path) as? String
    self.instance = aDecoder.decodeObject(forKey: SerializationKeys.instance) as? SnffrInstance
    self.value = aDecoder.decodeObject(forKey: SerializationKeys.value) as? String
    self.validatorArgs = aDecoder.decodeObject(forKey: SerializationKeys.validatorArgs) as? [SnffrValidatorArgs]
    self.validatorName = aDecoder.decodeObject(forKey: SerializationKeys.validatorName) as? String
    self.raw = aDecoder.decodeObject(forKey: SerializationKeys.raw) as? SnffrRaw
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
    self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
    self.validatorKey = aDecoder.decodeObject(forKey: SerializationKeys.validatorKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(origin, forKey: SerializationKeys.origin)
    aCoder.encode(path, forKey: SerializationKeys.path)
    aCoder.encode(instance, forKey: SerializationKeys.instance)
    aCoder.encode(value, forKey: SerializationKeys.value)
    aCoder.encode(validatorArgs, forKey: SerializationKeys.validatorArgs)
    aCoder.encode(validatorName, forKey: SerializationKeys.validatorName)
    aCoder.encode(raw, forKey: SerializationKeys.raw)
    aCoder.encode(message, forKey: SerializationKeys.message)
    aCoder.encode(type, forKey: SerializationKeys.type)
    aCoder.encode(validatorKey, forKey: SerializationKeys.validatorKey)
  }

}
