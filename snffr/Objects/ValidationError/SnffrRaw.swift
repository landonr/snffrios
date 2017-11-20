//
//  SnffrRaw.swift
//
//  Created by Landon Rohatensky on 2017-11-20
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class SnffrRaw: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let validatorName = "validatorName"
    static let validatorArgs = "validatorArgs"
  }

  // MARK: Properties
  public var validatorName: String?
  public var validatorArgs: [SnffrValidatorArgs]?

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
    validatorName <- map[SerializationKeys.validatorName]
    validatorArgs <- map[SerializationKeys.validatorArgs]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = validatorName { dictionary[SerializationKeys.validatorName] = value }
    if let value = validatorArgs { dictionary[SerializationKeys.validatorArgs] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.validatorName = aDecoder.decodeObject(forKey: SerializationKeys.validatorName) as? String
    self.validatorArgs = aDecoder.decodeObject(forKey: SerializationKeys.validatorArgs) as? [SnffrValidatorArgs]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(validatorName, forKey: SerializationKeys.validatorName)
    aCoder.encode(validatorArgs, forKey: SerializationKeys.validatorArgs)
  }

}
