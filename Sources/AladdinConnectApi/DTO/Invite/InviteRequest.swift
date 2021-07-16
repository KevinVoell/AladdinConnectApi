//
//  InviteRequest.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on June 7, 2021

import Foundation
import SwiftyJSON

public enum InviteAction: String, Codable {
  case accept = "accept"
  case decline = "decline"
}

public class InviteRequest : Codable, Serializable {
  
  var action : InviteAction?
  
  public init(action: InviteAction) {
    self.action = action
  }
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }

    action = InviteAction.init(rawValue: json["action"].stringValue)
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if let action = self.action {
      dictionary["action"] = "\(action)"
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    action = aDecoder.decodeObject(forKey: "action") as? InviteAction
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if action != nil{
      aCoder.encode(action, forKey: "action")
    }
  }
}
