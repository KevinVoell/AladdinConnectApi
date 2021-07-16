//
//  GetStatusResponse.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on May 30, 2021

import Foundation
import SwiftyJSON


public class GetStatusResponse : NSObject, NSCoding{
  
  public var createdAt : String?
  public var descriptionField : String?
  public var doors : [Door]?
  public var family : Int?
  public var id : Int?
  public var isEnabled : Bool?
  public var isExpired : Bool?
  public var isLocked : Bool?
  public var isUpdatingFirmware : Bool?
  public var legacyId : String?
  public var legacyKey : String?
  public var legacyRid : String?
  public var locationId : Int?
  public var locationName : String?
  public var luaVersion : String?
  public var message : String?
  public var model : String?
  public var name : String?
  public var ownership : String?
  public var rssi : Int?
  public var serial : String?
  public var ssid : String?
  public var status : Int?
  public var timezone : String?
  public var updatedAt : String?
  public var userId : Int?
  public var vendor : String?
  public var zipcode : String?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    createdAt = json["created_at"].stringValue
    descriptionField = json["description"].stringValue
    doors = [Door]()
    let doorsArray = json["doors"].arrayValue
    for doorsJson in doorsArray{
      let value = Door(fromJson: doorsJson)
      doors?.append(value)
    }
    family = json["family"].intValue
    id = json["id"].intValue
    isEnabled = json["is_enabled"].boolValue
    isExpired = json["is_expired"].boolValue
    isLocked = json["is_locked"].boolValue
    isUpdatingFirmware = json["is_updating_firmware"].boolValue
    legacyId = json["legacy_id"].stringValue
    legacyKey = json["legacy_key"].stringValue
    legacyRid = json["legacy_rid"].stringValue
    locationId = json["location_id"].intValue
    locationName = json["location_name"].stringValue
    luaVersion = json["lua_version"].stringValue
    message = json["message"].stringValue
    model = json["model"].stringValue
    name = json["name"].stringValue
    ownership = json["ownership"].stringValue
    rssi = json["rssi"].intValue
    serial = json["serial"].stringValue
    ssid = json["ssid"].stringValue
    status = json["status"].intValue
    timezone = json["timezone"].stringValue
    updatedAt = json["updated_at"].stringValue
    userId = json["user_id"].intValue
    vendor = json["vendor"].stringValue
    zipcode = json["zipcode"].stringValue
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
    if let doors = self.doors {
      var dictionaryElements = [[String:Any]]()
      for doorsElement in doors {
        dictionaryElements.append(doorsElement.toDictionary())
      }
      dictionary["doors"] = dictionaryElements
    }
    if family != nil{
      dictionary["family"] = family
    }
    if id != nil{
      dictionary["id"] = id
    }
    if isEnabled != nil{
      dictionary["is_enabled"] = isEnabled
    }
    if isExpired != nil{
      dictionary["is_expired"] = isExpired
    }
    if isLocked != nil{
      dictionary["is_locked"] = isLocked
    }
    if isUpdatingFirmware != nil{
      dictionary["is_updating_firmware"] = isUpdatingFirmware
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
    if locationId != nil{
      dictionary["location_id"] = locationId
    }
    if locationName != nil{
      dictionary["location_name"] = locationName
    }
    if luaVersion != nil{
      dictionary["lua_version"] = luaVersion
    }
    if message != nil{
      dictionary["message"] = message
    }
    if model != nil{
      dictionary["model"] = model
    }
    if name != nil{
      dictionary["name"] = name
    }
    if ownership != nil{
      dictionary["ownership"] = ownership
    }
    if rssi != nil{
      dictionary["rssi"] = rssi
    }
    if serial != nil{
      dictionary["serial"] = serial
    }
    if ssid != nil{
      dictionary["ssid"] = ssid
    }
    if status != nil{
      dictionary["status"] = status
    }
    if timezone != nil{
      dictionary["timezone"] = timezone
    }
    if updatedAt != nil{
      dictionary["updated_at"] = updatedAt
    }
    if userId != nil{
      dictionary["user_id"] = userId
    }
    if vendor != nil{
      dictionary["vendor"] = vendor
    }
    if zipcode != nil{
      dictionary["zipcode"] = zipcode
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
    descriptionField = aDecoder.decodeObject(forKey: "description") as? String
    doors = aDecoder.decodeObject(forKey: "doors") as? [Door]
    family = aDecoder.decodeObject(forKey: "family") as? Int
    id = aDecoder.decodeObject(forKey: "id") as? Int
    isEnabled = aDecoder.decodeObject(forKey: "is_enabled") as? Bool
    isExpired = aDecoder.decodeObject(forKey: "is_expired") as? Bool
    isLocked = aDecoder.decodeObject(forKey: "is_locked") as? Bool
    isUpdatingFirmware = aDecoder.decodeObject(forKey: "is_updating_firmware") as? Bool
    legacyId = aDecoder.decodeObject(forKey: "legacy_id") as? String
    legacyKey = aDecoder.decodeObject(forKey: "legacy_key") as? String
    legacyRid = aDecoder.decodeObject(forKey: "legacy_rid") as? String
    locationId = aDecoder.decodeObject(forKey: "location_id") as? Int
    locationName = aDecoder.decodeObject(forKey: "location_name") as? String
    luaVersion = aDecoder.decodeObject(forKey: "lua_version") as? String
    message = aDecoder.decodeObject(forKey: "message") as? String
    model = aDecoder.decodeObject(forKey: "model") as? String
    name = aDecoder.decodeObject(forKey: "name") as? String
    ownership = aDecoder.decodeObject(forKey: "ownership") as? String
    rssi = aDecoder.decodeObject(forKey: "rssi") as? Int
    serial = aDecoder.decodeObject(forKey: "serial") as? String
    ssid = aDecoder.decodeObject(forKey: "ssid") as? String
    status = aDecoder.decodeObject(forKey: "status") as? Int
    timezone = aDecoder.decodeObject(forKey: "timezone") as? String
    updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
    userId = aDecoder.decodeObject(forKey: "user_id") as? Int
    vendor = aDecoder.decodeObject(forKey: "vendor") as? String
    zipcode = aDecoder.decodeObject(forKey: "zipcode") as? String
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
    if doors != nil{
      aCoder.encode(doors, forKey: "doors")
    }
    if family != nil{
      aCoder.encode(family, forKey: "family")
    }
    if id != nil{
      aCoder.encode(id, forKey: "id")
    }
    if isEnabled != nil{
      aCoder.encode(isEnabled, forKey: "is_enabled")
    }
    if isExpired != nil{
      aCoder.encode(isExpired, forKey: "is_expired")
    }
    if isLocked != nil{
      aCoder.encode(isLocked, forKey: "is_locked")
    }
    if isUpdatingFirmware != nil{
      aCoder.encode(isUpdatingFirmware, forKey: "is_updating_firmware")
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
    if locationId != nil{
      aCoder.encode(locationId, forKey: "location_id")
    }
    if locationName != nil{
      aCoder.encode(locationName, forKey: "location_name")
    }
    if luaVersion != nil{
      aCoder.encode(luaVersion, forKey: "lua_version")
    }
    if message != nil{
      aCoder.encode(message, forKey: "message")
    }
    if model != nil{
      aCoder.encode(model, forKey: "model")
    }
    if name != nil{
      aCoder.encode(name, forKey: "name")
    }
    if ownership != nil{
      aCoder.encode(ownership, forKey: "ownership")
    }
    if rssi != nil{
      aCoder.encode(rssi, forKey: "rssi")
    }
    if serial != nil{
      aCoder.encode(serial, forKey: "serial")
    }
    if ssid != nil{
      aCoder.encode(ssid, forKey: "ssid")
    }
    if status != nil{
      aCoder.encode(status, forKey: "status")
    }
    if timezone != nil{
      aCoder.encode(timezone, forKey: "timezone")
    }
    if updatedAt != nil{
      aCoder.encode(updatedAt, forKey: "updated_at")
    }
    if userId != nil{
      aCoder.encode(userId, forKey: "user_id")
    }
    if vendor != nil{
      aCoder.encode(vendor, forKey: "vendor")
    }
    if zipcode != nil{
      aCoder.encode(zipcode, forKey: "zipcode")
    }
    
  }
  
}
