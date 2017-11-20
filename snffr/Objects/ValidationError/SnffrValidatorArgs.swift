//
//  SnffrValidatorArgs.swift
//
//  Created by Landon Rohatensky on 2017-11-20
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class SnffrValidatorArgs: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {

  }

  // MARK: Properties


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

  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    let dictionary: [String: Any] = [:]

    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {

  }

  public func encode(with aCoder: NSCoder) {

  }

}
