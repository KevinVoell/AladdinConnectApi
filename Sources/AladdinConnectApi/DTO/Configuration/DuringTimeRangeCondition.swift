//
//  DuringTimeRangeCondition.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftDate
import SwiftyJSON


public class DuringTimeRangeCondition : Codable {
  
  public var doorOperation : String?
  public var doorState : String?
  public var endTime : DateInRegion?
  public var sendNotification : Bool?
  public var startTime : DateInRegion?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    doorOperation = json["door_operation"].stringValue
    doorState = json["door_state"].stringValue
    endTime = json["end_time"].stringValue.toDate()
    sendNotification = json["send_notification"].boolValue
    startTime = json["start_time"].stringValue.toDate()
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if doorOperation != nil{
      dictionary["door_operation"] = doorOperation
    }
    if doorState != nil{
      dictionary["door_state"] = doorState
    }
    if endTime != nil{
      dictionary["end_time"] = endTime
    }
    if sendNotification != nil{
      dictionary["send_notification"] = sendNotification
    }
    if startTime != nil{
      dictionary["start_time"] = startTime
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    doorOperation = aDecoder.decodeObject(forKey: "door_operation") as? String
    doorState = aDecoder.decodeObject(forKey: "door_state") as? String
    endTime = aDecoder.decodeObject(forKey: "end_time") as? DateInRegion
    sendNotification = aDecoder.decodeObject(forKey: "send_notification") as? Bool
    startTime = aDecoder.decodeObject(forKey: "start_time") as? DateInRegion
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if doorOperation != nil{
      aCoder.encode(doorOperation, forKey: "door_operation")
    }
    if doorState != nil{
      aCoder.encode(doorState, forKey: "door_state")
    }
    if endTime != nil{
      aCoder.encode(endTime, forKey: "end_time")
    }
    if sendNotification != nil{
      aCoder.encode(sendNotification, forKey: "send_notification")
    }
    if startTime != nil{
      aCoder.encode(startTime, forKey: "start_time")
    }
    
  }
  
}
