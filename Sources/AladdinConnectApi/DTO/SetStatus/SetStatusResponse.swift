//
//  SetStatusResponse.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on May 30, 2021

import Foundation
import SwiftyJSON


public class SetStatusResponse : NSObject, NSCoding{
  
  public var message : String?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    message = json["message"].stringValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if message != nil{
      dictionary["message"] = message
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    message = aDecoder.decodeObject(forKey: "message") as? String
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if message != nil{
      aCoder.encode(message, forKey: "message")
    }
    
  }
  
}
