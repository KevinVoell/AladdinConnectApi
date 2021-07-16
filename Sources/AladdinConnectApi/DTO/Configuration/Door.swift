//
//  Door.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftDate
import SwiftyJSON

public enum DoorStatus: Int, Codable {
  case unknown = 0
  case open = 1
  case opening = 2
  case timeoutOpening = 3
  case closed = 4
  case closing = 5
  case timeoutClosing = 6
  case notConfigured = 7
}

public class Door : Codable, Identifiable {
  
  public var batteryLevel : Int?
  public var bleStrength : Int?
  public var createdAt : String?
  public var desiredDoorStatus : String?
  public var desiredDoorStatusOutcome : String?
  public var desiredStatus : Int?
  public var deviceId : Int?
  public var doorIndex : Int?
  public var doorUpdatedAt : DateInRegion?
  public var fault : Int?
  public var icon : Int?
  public var id : Int?
  public var isEnabled : Bool?
  public var linkStatus : Int?
  public var name : String?
  public var status : DoorStatus?
  public var updatedAt : DateInRegion?
  public var userId : Int?
  public var vehicleColor : String?
  public var vehicleType : String?
  public var inviteId: Int?
  public var ownerEmail: String?
  
  public init(batteryLevel : Int,
              bleStrength : Int,
              createdAt : String,
              desiredDoorStatus : String,
              desiredDoorStatusOutcome : String,
              desiredStatus : Int,
              deviceId : Int,
              doorIndex : Int,
              doorUpdatedAt : DateInRegion,
              fault : Int,
              icon : Int,
              id : Int,
              isEnabled : Bool,
              linkStatus : Int,
              name : String,
              status : DoorStatus,
              updatedAt : DateInRegion,
              userId : Int,
              vehicleColor : String,
              vehicleType : String,
              inviteId: Int,
              ownerEmail: String) {
    self.batteryLevel = batteryLevel
    self.bleStrength = bleStrength
    self.createdAt = createdAt
    self.desiredDoorStatus = desiredDoorStatus
    self.desiredDoorStatusOutcome = desiredDoorStatusOutcome
    self.desiredStatus = desiredStatus
    self.deviceId = deviceId
    self.doorIndex = doorIndex
    self.doorUpdatedAt = doorUpdatedAt
    self.fault = fault
    self.icon = icon
    self.id = id
    self.isEnabled = isEnabled
    self.linkStatus = linkStatus
    self.name = name
    self.status = status
    self.updatedAt = updatedAt
    self.userId = userId
    self.vehicleColor = vehicleColor
    self.vehicleType = vehicleType
    self.inviteId = inviteId
    self.ownerEmail = ownerEmail
  }
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    batteryLevel = json["battery_level"].intValue
    bleStrength = json["ble_strength"].intValue
    createdAt = json["created_at"].stringValue
    desiredDoorStatus = json["desired_door_status"].stringValue
    desiredDoorStatusOutcome = json["desired_door_status_outcome"].stringValue
    desiredStatus = json["desired_status"].intValue
    deviceId = json["device_id"].intValue
    doorIndex = json["door_index"].intValue
    doorUpdatedAt = json["door_updated_at"].stringValue.toDate()
    fault = json["fault"].intValue
    icon = json["icon"].intValue
    id = json["id"].intValue
    isEnabled = json["is_enabled"].boolValue
    linkStatus = json["link_status"].intValue
    name = json["name"].stringValue
    status = DoorStatus.init(rawValue: json["status"].intValue)
    updatedAt = json["updated_at"].stringValue.toDate()
    userId = json["user_id"].intValue
    vehicleColor = json["vehicle_color"].stringValue
    vehicleType = json["vehicle_type"].stringValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if batteryLevel != nil{
      dictionary["battery_level"] = batteryLevel
    }
    if bleStrength != nil{
      dictionary["ble_strength"] = bleStrength
    }
    if createdAt != nil{
      dictionary["created_at"] = createdAt
    }
    if desiredDoorStatus != nil{
      dictionary["desired_door_status"] = desiredDoorStatus
    }
    if desiredDoorStatusOutcome != nil{
      dictionary["desired_door_status_outcome"] = desiredDoorStatusOutcome
    }
    if desiredStatus != nil{
      dictionary["desired_status"] = desiredStatus
    }
    if deviceId != nil{
      dictionary["device_id"] = deviceId
    }
    if doorIndex != nil{
      dictionary["door_index"] = doorIndex
    }
    if doorUpdatedAt != nil{
      dictionary["door_updated_at"] = doorUpdatedAt
    }
    if fault != nil{
      dictionary["fault"] = fault
    }
    if icon != nil{
      dictionary["icon"] = icon
    }
    if id != nil{
      dictionary["id"] = id
    }
    if isEnabled != nil{
      dictionary["is_enabled"] = isEnabled
    }
    if linkStatus != nil{
      dictionary["link_status"] = linkStatus
    }
    if name != nil{
      dictionary["name"] = name
    }
    if status != nil{
      dictionary["status"] = status
    }
    if updatedAt != nil{
      dictionary["updated_at"] = updatedAt
    }
    if userId != nil{
      dictionary["user_id"] = userId
    }
    if vehicleColor != nil{
      dictionary["vehicle_color"] = vehicleColor
    }
    if vehicleType != nil{
      dictionary["vehicle_type"] = vehicleType
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    batteryLevel = aDecoder.decodeObject(forKey: "battery_level") as? Int
    bleStrength = aDecoder.decodeObject(forKey: "ble_strength") as? Int
    createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
    desiredDoorStatus = aDecoder.decodeObject(forKey: "desired_door_status") as? String
    desiredDoorStatusOutcome = aDecoder.decodeObject(forKey: "desired_door_status_outcome") as? String
    desiredStatus = aDecoder.decodeObject(forKey: "desired_status") as? Int
    deviceId = aDecoder.decodeObject(forKey: "device_id") as? Int
    doorIndex = aDecoder.decodeObject(forKey: "door_index") as? Int
    doorUpdatedAt = aDecoder.decodeObject(forKey: "door_updated_at") as? DateInRegion
    fault = aDecoder.decodeObject(forKey: "fault") as? Int
    icon = aDecoder.decodeObject(forKey: "icon") as? Int
    id = aDecoder.decodeObject(forKey: "id") as? Int
    isEnabled = aDecoder.decodeObject(forKey: "is_enabled") as? Bool
    linkStatus = aDecoder.decodeObject(forKey: "link_status") as? Int
    name = aDecoder.decodeObject(forKey: "name") as? String
    status = aDecoder.decodeObject(forKey: "status") as? DoorStatus
    updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? DateInRegion
    userId = aDecoder.decodeObject(forKey: "user_id") as? Int
    vehicleColor = aDecoder.decodeObject(forKey: "vehicle_color") as? String
    vehicleType = aDecoder.decodeObject(forKey: "vehicle_type") as? String
    inviteId = aDecoder.decodeObject(forKey: "inviteId") as? Int
    ownerEmail = aDecoder.decodeObject(forKey: "ownerEmail") as? String
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if batteryLevel != nil{
      aCoder.encode(batteryLevel, forKey: "battery_level")
    }
    if bleStrength != nil{
      aCoder.encode(bleStrength, forKey: "ble_strength")
    }
    if createdAt != nil{
      aCoder.encode(createdAt, forKey: "created_at")
    }
    if desiredDoorStatus != nil{
      aCoder.encode(desiredDoorStatus, forKey: "desired_door_status")
    }
    if desiredDoorStatusOutcome != nil{
      aCoder.encode(desiredDoorStatusOutcome, forKey: "desired_door_status_outcome")
    }
    if desiredStatus != nil{
      aCoder.encode(desiredStatus, forKey: "desired_status")
    }
    if deviceId != nil{
      aCoder.encode(deviceId, forKey: "device_id")
    }
    if doorIndex != nil{
      aCoder.encode(doorIndex, forKey: "door_index")
    }
    if doorUpdatedAt != nil{
      aCoder.encode(doorUpdatedAt, forKey: "door_updated_at")
    }
    if fault != nil{
      aCoder.encode(fault, forKey: "fault")
    }
    if icon != nil{
      aCoder.encode(icon, forKey: "icon")
    }
    if id != nil{
      aCoder.encode(id, forKey: "id")
    }
    if isEnabled != nil{
      aCoder.encode(isEnabled, forKey: "is_enabled")
    }
    if linkStatus != nil{
      aCoder.encode(linkStatus, forKey: "link_status")
    }
    if name != nil{
      aCoder.encode(name, forKey: "name")
    }
    if status != nil{
      aCoder.encode(status, forKey: "status")
    }
    if updatedAt != nil{
      aCoder.encode(updatedAt, forKey: "updated_at")
    }
    if userId != nil{
      aCoder.encode(userId, forKey: "user_id")
    }
    if vehicleColor != nil{
      aCoder.encode(vehicleColor, forKey: "vehicle_color")
    }
    if vehicleType != nil{
      aCoder.encode(vehicleType, forKey: "vehicle_type")
    }
    if inviteId != nil {
      aCoder.encode(inviteId, forKey: "inviteId")
    }
    if ownerEmail != nil {
      aCoder.encode(ownerEmail, forKey: "ownerEmail")
    }
  }
  
}
