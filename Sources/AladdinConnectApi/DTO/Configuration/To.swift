//
//  To.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftyJSON


public class To : Codable {
  
  public var allowed : Bool?
  public var email : String?
  public var id : Int?
  public var name : String?
  public var overrideSchedule : Bool?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    allowed = json["allowed"].boolValue
    email = json["email"].stringValue
    id = json["id"].intValue
    name = json["name"].stringValue
    overrideSchedule = json["override_schedule"].boolValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if allowed != nil{
      dictionary["allowed"] = allowed
    }
    if email != nil{
      dictionary["email"] = email
    }
    if id != nil{
      dictionary["id"] = id
    }
    if name != nil{
      dictionary["name"] = name
    }
    if overrideSchedule != nil{
      dictionary["override_schedule"] = overrideSchedule
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    allowed = aDecoder.decodeObject(forKey: "allowed") as? Bool
    email = aDecoder.decodeObject(forKey: "email") as? String
    id = aDecoder.decodeObject(forKey: "id") as? Int
    name = aDecoder.decodeObject(forKey: "name") as? String
    overrideSchedule = aDecoder.decodeObject(forKey: "override_schedule") as? Bool
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if allowed != nil{
      aCoder.encode(allowed, forKey: "allowed")
    }
    if email != nil{
      aCoder.encode(email, forKey: "email")
    }
    if id != nil{
      aCoder.encode(id, forKey: "id")
    }
    if name != nil{
      aCoder.encode(name, forKey: "name")
    }
    if overrideSchedule != nil{
      aCoder.encode(overrideSchedule, forKey: "override_schedule")
    }
    
  }
  
}
