//
//  SetStatusRequest.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on May 30, 2021

import Foundation
import SwiftyJSON


public class SetStatusRequest : Codable, Serializable {
  
  public var commandKey : String?
  public var inviteId : Int?
  
  
  /// Initialize the instance using the passed in values
  /// - Parameter commandKey: The command to send to the Api
  public init(commandKey: String, inviteId: Int? = nil) {
    self.commandKey = commandKey
    self.inviteId = inviteId
  }
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    commandKey = json["command_key"].stringValue
    inviteId = json["invite_id"].intValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if commandKey != nil{
      dictionary["command_key"] = commandKey
    }
    
    if inviteId != nil {
      dictionary["invite_id"] = inviteId
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    commandKey = aDecoder.decodeObject(forKey: "command_key") as? String
    inviteId = aDecoder.decodeObject(forKey: "invite_id") as? Int
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if commandKey != nil{
      aCoder.encode(commandKey, forKey: "command_key")
    }
    
    if inviteId != nil {
      aCoder.encode(inviteId, forKey: "invite_id")
    }
  }
  
}
