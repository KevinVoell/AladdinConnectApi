//
//  Sent.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftDate
import SwiftyJSON


public class Sent : Codable {
  
  public var createdAt : DateInRegion?
  public var devices : [Device]?
  public var id : Int?
  public var isEnabled : Bool?
  public var name : String?
  public var ownerEmail : String?
  public var ownerName : String?
  public var schedule : Schedule?
  public var status : String?
  public var to : To?
  public var type : String?
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
    devices = [Device]()
    let devicesArray = json["devices"].arrayValue
    for devicesJson in devicesArray{
      let value = Device(fromJson: devicesJson)
      devices?.append(value)
    }
    id = json["id"].intValue
    isEnabled = json["is_enabled"].boolValue
    name = json["name"].stringValue
    ownerEmail = json["owner_email"].stringValue
    ownerName = json["owner_name"].stringValue
    let scheduleJson = json["schedule"]
    if !scheduleJson.isEmpty{
      schedule = Schedule(fromJson: scheduleJson)
    }
    status = json["status"].stringValue
    let toJson = json["to"]
    if !toJson.isEmpty{
      to = To(fromJson: toJson)
    }
    type = json["type"].stringValue
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
    if let devices  = self.devices {
      var dictionaryElements = [[String:Any]]()
      for devicesElement in devices {
        dictionaryElements.append(devicesElement.toDictionary())
      }
      dictionary["devices"] = dictionaryElements
    }
    if id != nil{
      dictionary["id"] = id
    }
    if isEnabled != nil{
      dictionary["is_enabled"] = isEnabled
    }
    if name != nil{
      dictionary["name"] = name
    }
    if ownerEmail != nil{
      dictionary["owner_email"] = ownerEmail
    }
    if ownerName != nil{
      dictionary["owner_name"] = ownerName
    }
    if schedule != nil{
      dictionary["schedule"] = schedule?.toDictionary()
    }
    if status != nil{
      dictionary["status"] = status
    }
    if to != nil{
      dictionary["to"] = to?.toDictionary()
    }
    if type != nil{
      dictionary["type"] = type
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
    devices = aDecoder.decodeObject(forKey: "devices") as? [Device]
    id = aDecoder.decodeObject(forKey: "id") as? Int
    isEnabled = aDecoder.decodeObject(forKey: "is_enabled") as? Bool
    name = aDecoder.decodeObject(forKey: "name") as? String
    ownerEmail = aDecoder.decodeObject(forKey: "owner_email") as? String
    ownerName = aDecoder.decodeObject(forKey: "owner_name") as? String
    schedule = aDecoder.decodeObject(forKey: "schedule") as? Schedule
    status = aDecoder.decodeObject(forKey: "status") as? String
    to = aDecoder.decodeObject(forKey: "to") as? To
    type = aDecoder.decodeObject(forKey: "type") as? String
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
    if devices != nil{
      aCoder.encode(devices, forKey: "devices")
    }
    if id != nil{
      aCoder.encode(id, forKey: "id")
    }
    if isEnabled != nil{
      aCoder.encode(isEnabled, forKey: "is_enabled")
    }
    if name != nil{
      aCoder.encode(name, forKey: "name")
    }
    if ownerEmail != nil{
      aCoder.encode(ownerEmail, forKey: "owner_email")
    }
    if ownerName != nil{
      aCoder.encode(ownerName, forKey: "owner_name")
    }
    if schedule != nil{
      aCoder.encode(schedule, forKey: "schedule")
    }
    if status != nil{
      aCoder.encode(status, forKey: "status")
    }
    if to != nil{
      aCoder.encode(to, forKey: "to")
    }
    if type != nil{
      aCoder.encode(type, forKey: "type")
    }
    if updatedAt != nil{
      aCoder.encode(updatedAt, forKey: "updated_at")
    }
    if userId != nil{
      aCoder.encode(userId, forKey: "user_id")
    }
    
  }
  
}
