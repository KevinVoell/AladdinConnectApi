//
//  Schedule.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftDate
import SwiftyJSON


public class Schedule : Codable {
  
  public var allDay : Bool?
  public var endDate : DateInRegion?
  public var recurringWindowEndTime : DateInRegion?
  public var recurringWindowStartTime : DateInRegion?
  public var repeatDays : [String]?
  public var repeatFreq : String?
  public var startDate : DateInRegion?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    allDay = json["allDay"].boolValue
    endDate = json["endDate"].stringValue.toDate()
    recurringWindowEndTime = json["recurringWindowEndTime"].stringValue.toDate()
    recurringWindowStartTime = json["recurringWindowStartTime"].stringValue.toDate()
    repeatDays = [String]()
    let repeatDaysArray = json["repeatDays"].arrayValue
    for repeatDaysJson in repeatDaysArray{
      repeatDays?.append(repeatDaysJson.stringValue)
    }
    repeatFreq = json["repeatFreq"].stringValue
    startDate = json["startDate"].stringValue.toDate()
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if allDay != nil{
      dictionary["allDay"] = allDay
    }
    if endDate != nil{
      dictionary["endDate"] = endDate
    }
    if recurringWindowEndTime != nil{
      dictionary["recurringWindowEndTime"] = recurringWindowEndTime
    }
    if recurringWindowStartTime != nil{
      dictionary["recurringWindowStartTime"] = recurringWindowStartTime
    }
    if repeatDays != nil{
      dictionary["repeatDays"] = repeatDays
    }
    if repeatFreq != nil{
      dictionary["repeatFreq"] = repeatFreq
    }
    if startDate != nil{
      dictionary["startDate"] = startDate
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    allDay = aDecoder.decodeObject(forKey: "allDay") as? Bool
    endDate = aDecoder.decodeObject(forKey: "endDate") as? DateInRegion
    recurringWindowEndTime = aDecoder.decodeObject(forKey: "recurringWindowEndTime") as? DateInRegion
    recurringWindowStartTime = aDecoder.decodeObject(forKey: "recurringWindowStartTime") as? DateInRegion
    repeatDays = aDecoder.decodeObject(forKey: "repeatDays") as? [String]
    repeatFreq = aDecoder.decodeObject(forKey: "repeatFreq") as? String
    startDate = aDecoder.decodeObject(forKey: "startDate") as? DateInRegion
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if allDay != nil{
      aCoder.encode(allDay, forKey: "allDay")
    }
    if endDate != nil{
      aCoder.encode(endDate, forKey: "endDate")
    }
    if recurringWindowEndTime != nil{
      aCoder.encode(recurringWindowEndTime, forKey: "recurringWindowEndTime")
    }
    if recurringWindowStartTime != nil{
      aCoder.encode(recurringWindowStartTime, forKey: "recurringWindowStartTime")
    }
    if repeatDays != nil{
      aCoder.encode(repeatDays, forKey: "repeatDays")
    }
    if repeatFreq != nil{
      aCoder.encode(repeatFreq, forKey: "repeatFreq")
    }
    if startDate != nil{
      aCoder.encode(startDate, forKey: "startDate")
    }
    
  }
  
}
