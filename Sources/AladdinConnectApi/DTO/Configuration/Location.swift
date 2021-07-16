//
//  Location.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftDate
import SwiftyJSON


public class Location : Codable {
  
  public var createdAt : DateInRegion?
  public var descriptionField : String?
  public var id : Int?
  public var isEnabled : Bool?
  public var legacyId : String?
  public var legacyKey : String?
  public var legacyRid : String?
  public var name : String?
  public var updatedAt : DateInRegion?
  public var userId : Int?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    createdAt = json["created_at"].stringValue.toDate()
    descriptionField = json["description"].stringValue
    id = json["id"].intValue
    isEnabled = json["is_enabled"].boolValue
    legacyId = json["legacy_id"].stringValue
    legacyKey = json["legacy_key"].stringValue
    legacyRid = json["legacy_rid"].stringValue
    name = json["name"].stringValue
    updatedAt = json["updated_at"].stringValue.toDate()
    userId = json["user_id"].intValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if createdAt != nil{
      dictionary["created_at"] = createdAt
    }
    if descriptionField != nil{
      dictionary["description"] = descriptionField
    }
    if id != nil{
      dictionary["id"] = id
    }
    if isEnabled != nil{
      dictionary["is_enabled"] = isEnabled
    }
    if legacyId != nil{
      dictionary["legacy_id"] = legacyId
    }
    if legacyKey != nil{
      dictionary["legacy_key"] = legacyKey
    }
    if legacyRid != nil{
      dictionary["legacy_rid"] = legacyRid
    }
    if name != nil{
      dictionary["name"] = name
    }
    if updatedAt != nil{
      dictionary["updated_at"] = updatedAt
    }
    if userId != nil{
      dictionary["user_id"] = userId
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    createdAt = aDecoder.decodeObject(forKey: "created_at") as? DateInRegion
    descriptionField = aDecoder.decodeObject(forKey: "description") as? String
    id = aDecoder.decodeObject(forKey: "id") as? Int
    isEnabled = aDecoder.decodeObject(forKey: "is_enabled") as? Bool
    legacyId = aDecoder.decodeObject(forKey: "legacy_id") as? String
    legacyKey = aDecoder.decodeObject(forKey: "legacy_key") as? String
    legacyRid = aDecoder.decodeObject(forKey: "legacy_rid") as? String
    name = aDecoder.decodeObject(forKey: "name") as? String
    updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? DateInRegion
    userId = aDecoder.decodeObject(forKey: "user_id") as? Int
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if createdAt != nil{
      aCoder.encode(createdAt, forKey: "created_at")
    }
    if descriptionField != nil{
      aCoder.encode(descriptionField, forKey: "description")
    }
    if id != nil{
      aCoder.encode(id, forKey: "id")
    }
    if isEnabled != nil{
      aCoder.encode(isEnabled, forKey: "is_enabled")
    }
    if legacyId != nil{
      aCoder.encode(legacyId, forKey: "legacy_id")
    }
    if legacyKey != nil{
      aCoder.encode(legacyKey, forKey: "legacy_key")
    }
    if legacyRid != nil{
      aCoder.encode(legacyRid, forKey: "legacy_rid")
    }
    if name != nil{
      aCoder.encode(name, forKey: "name")
    }
    if updatedAt != nil{
      aCoder.encode(updatedAt, forKey: "updated_at")
    }
    if userId != nil{
      aCoder.encode(userId, forKey: "user_id")
    }
    
  }
  
}
