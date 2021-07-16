//
//  Setting.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftyJSON


public class Setting : Codable {
  
  public var id : Int?
  public var temporaryAccessEnabled : Bool?
  public var userId : Int?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    id = json["id"].intValue
    temporaryAccessEnabled = json["temporary_access_enabled"].boolValue
    userId = json["user_id"].intValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if id != nil{
      dictionary["id"] = id
    }
    if temporaryAccessEnabled != nil{
      dictionary["temporary_access_enabled"] = temporaryAccessEnabled
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
    id = aDecoder.decodeObject(forKey: "id") as? Int
    temporaryAccessEnabled = aDecoder.decodeObject(forKey: "temporary_access_enabled") as? Bool
    userId = aDecoder.decodeObject(forKey: "user_id") as? Int
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if id != nil{
      aCoder.encode(id, forKey: "id")
    }
    if temporaryAccessEnabled != nil{
      aCoder.encode(temporaryAccessEnabled, forKey: "temporary_access_enabled")
    }
    if userId != nil{
      aCoder.encode(userId, forKey: "user_id")
    }
    
  }
  
}
