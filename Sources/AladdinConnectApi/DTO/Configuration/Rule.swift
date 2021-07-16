//
//  Rule.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftDate
import SwiftyJSON


public class Rule : Codable {
  
  public var conditionType : String?
  public var createdAt : DateInRegion?
  public var days : [String]?
  public var devices : [Device]?
  public var duringTimeRangeConditions : DuringTimeRangeCondition?
  public var id : Int?
  public var isEnabled : Bool?
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
    conditionType = json["condition_type"].stringValue
    createdAt = json["created_at"].stringValue.toDate()
    days = [String]()
    let daysArray = json["days"].arrayValue
    for daysJson in daysArray{
      days?.append(daysJson.stringValue)
    }
    devices = [Device]()
    let devicesArray = json["devices"].arrayValue
    for devicesJson in devicesArray{
      let value = Device(fromJson: devicesJson)
      devices?.append(value)
    }
    let duringTimeRangeConditionsJson = json["during_time_range_conditions"]
    if !duringTimeRangeConditionsJson.isEmpty{
      duringTimeRangeConditions = DuringTimeRangeCondition(fromJson: duringTimeRangeConditionsJson)
    }
    id = json["id"].intValue
    isEnabled = json["is_enabled"].boolValue
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
    if conditionType != nil{
      dictionary["condition_type"] = conditionType
    }
    if createdAt != nil{
      dictionary["created_at"] = createdAt
    }
    if days != nil{
      dictionary["days"] = days
    }
    if let devices = self.devices{
      var dictionaryElements = [[String:Any]]()
      for devicesElement in devices {
        dictionaryElements.append(devicesElement.toDictionary())
      }
      dictionary["devices"] = dictionaryElements
    }
    if duringTimeRangeConditions != nil{
      dictionary["duringTimeRangeConditions"] = duringTimeRangeConditions?.toDictionary()
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
    conditionType = aDecoder.decodeObject(forKey: "condition_type") as? String
    createdAt = aDecoder.decodeObject(forKey: "created_at") as? DateInRegion
    days = aDecoder.decodeObject(forKey: "days") as? [String]
    devices = aDecoder.decodeObject(forKey: "devices") as? [Device]
    duringTimeRangeConditions = aDecoder.decodeObject(forKey: "during_time_range_conditions") as? DuringTimeRangeCondition
    id = aDecoder.decodeObject(forKey: "id") as? Int
    isEnabled = aDecoder.decodeObject(forKey: "is_enabled") as? Bool
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
    if conditionType != nil{
      aCoder.encode(conditionType, forKey: "condition_type")
    }
    if createdAt != nil{
      aCoder.encode(createdAt, forKey: "created_at")
    }
    if days != nil{
      aCoder.encode(days, forKey: "days")
    }
    if devices != nil{
      aCoder.encode(devices, forKey: "devices")
    }
    if duringTimeRangeConditions != nil{
      aCoder.encode(duringTimeRangeConditions, forKey: "during_time_range_conditions")
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
    if updatedAt != nil{
      aCoder.encode(updatedAt, forKey: "updated_at")
    }
    if userId != nil{
      aCoder.encode(userId, forKey: "user_id")
    }
    
  }
  
}
