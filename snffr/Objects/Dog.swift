//
//  Dog.swift
//
//  Created by Landon Rohatensky on 2017-09-30
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Dog: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let height = "height"
        static let careGiverId = "careGiverId"
        static let updatedAt = "updated_at"
        static let name = "name"
        static let about = "about"
        static let dogId = "dogId"
        static let createdAt = "created_at"
        static let adoptionStatus = "adoptionStatus"
        static let version = "version"
        static let age = "age"
        static let weight = "weight"
        static let dogTypeId = "dogTypeId"
        static let profileUrl = "profileUrl"
    }
    
    // MARK: Properties
    public var height: Int?
    public var careGiverId: Int?
    public var updatedAt: String?
    public var name: String?
    public var about: String?
    public var dogId: Int?
    public var createdAt: String?
    public var adoptionStatus: Int?
    public var version: Int?
    public var age: Int?
    public var weight: Int?
    public var dogTypeId: Int?
    public var profileUrl: String?
    public var image: UIImage?
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public required init?(map: Map){
        
    }
    
    func downloadImage(indexpathRow: Int, completion: @escaping (Bool, Int) -> Swift.Void)  {
        if let link = self.profileUrl {
            let imageURL = URL.init(string: link)
            URLSession.shared.dataTask(with: imageURL!, completionHandler: { (data, response, error) in
                if error == nil {
                    self.image = UIImage.init(data: data!)
                    completion(true, indexpathRow)
                }
            }).resume()
        }
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public func mapping(map: Map) {
        height <- map[SerializationKeys.height]
        careGiverId <- map[SerializationKeys.careGiverId]
        updatedAt <- map[SerializationKeys.updatedAt]
        name <- map[SerializationKeys.name]
        dogId <- map[SerializationKeys.dogId]
        createdAt <- map[SerializationKeys.createdAt]
        adoptionStatus <- map[SerializationKeys.adoptionStatus]
        version <- map[SerializationKeys.version]
        age <- map[SerializationKeys.age]
        weight <- map[SerializationKeys.weight]
        dogTypeId <- map[SerializationKeys.dogTypeId]
        profileUrl <- map[SerializationKeys.profileUrl]
        about <- map[SerializationKeys.about]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = height { dictionary[SerializationKeys.height] = value }
        if let value = careGiverId { dictionary[SerializationKeys.careGiverId] = value }
        if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = dogId { dictionary[SerializationKeys.dogId] = value }
        if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
        if let value = adoptionStatus { dictionary[SerializationKeys.adoptionStatus] = value }
        if let value = version { dictionary[SerializationKeys.version] = value }
        if let value = age { dictionary[SerializationKeys.age] = value }
        if let value = weight { dictionary[SerializationKeys.weight] = value }
        if let value = dogTypeId { dictionary[SerializationKeys.dogTypeId] = value }
        if let value = profileUrl { dictionary[SerializationKeys.profileUrl] = value }
        if let value = about { dictionary[SerializationKeys.profileUrl] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.height = aDecoder.decodeObject(forKey: SerializationKeys.height) as? Int
        self.careGiverId = aDecoder.decodeObject(forKey: SerializationKeys.careGiverId) as? Int
        self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
        self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.dogId = aDecoder.decodeObject(forKey: SerializationKeys.dogId) as? Int
        self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
        self.adoptionStatus = aDecoder.decodeObject(forKey: SerializationKeys.adoptionStatus) as? Int
        self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? Int
        self.age = aDecoder.decodeObject(forKey: SerializationKeys.age) as? Int
        self.weight = aDecoder.decodeObject(forKey: SerializationKeys.weight) as? Int
        self.dogTypeId = aDecoder.decodeObject(forKey: SerializationKeys.dogTypeId) as? Int
        self.profileUrl = aDecoder.decodeObject(forKey: SerializationKeys.profileUrl) as? String
        self.about = aDecoder.decodeObject(forKey: SerializationKeys.about) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(height, forKey: SerializationKeys.height)
        aCoder.encode(careGiverId, forKey: SerializationKeys.careGiverId)
        aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
        aCoder.encode(name, forKey: SerializationKeys.name)
        aCoder.encode(dogId, forKey: SerializationKeys.dogId)
        aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
        aCoder.encode(adoptionStatus, forKey: SerializationKeys.adoptionStatus)
        aCoder.encode(version, forKey: SerializationKeys.version)
        aCoder.encode(age, forKey: SerializationKeys.age)
        aCoder.encode(weight, forKey: SerializationKeys.weight)
        aCoder.encode(dogTypeId, forKey: SerializationKeys.dogTypeId)
        aCoder.encode(profileUrl, forKey: SerializationKeys.profileUrl)
        aCoder.encode(about, forKey: SerializationKeys.about)
    }
    
}

