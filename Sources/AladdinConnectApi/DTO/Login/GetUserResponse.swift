//
//  GetUserResponse.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on May 30, 2021

import Foundation
import SwiftyJSON


public class GetUserResponse : Codable {
  
  public var acceptTerms : Bool?
  public var activated : Bool?
  public var email : String?
  public var id : Int?
  public var name : String?
  
  public init(acceptTerms: Bool,
              activated: Bool,
              email: String,
              id: Int,
              name: String) {
    self.acceptTerms = acceptTerms
    self.activated = activated
    self.email = email
    self.id = id
    self.name = name
  }
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    acceptTerms = json["accept_terms"].boolValue
    activated = json["activated"].boolValue
    email = json["email"].stringValue
    id = json["id"].intValue
    name = json["name"].stringValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if acceptTerms != nil{
      dictionary["accept_terms"] = acceptTerms
    }
    if activated != nil{
      dictionary["activated"] = activated
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
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    acceptTerms = aDecoder.decodeObject(forKey: "accept_terms") as? Bool
    activated = aDecoder.decodeObject(forKey: "activated") as? Bool
    email = aDecoder.decodeObject(forKey: "email") as? String
    id = aDecoder.decodeObject(forKey: "id") as? Int
    name = aDecoder.decodeObject(forKey: "name") as? String
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if acceptTerms != nil{
      aCoder.encode(acceptTerms, forKey: "accept_terms")
    }
    if activated != nil{
      aCoder.encode(activated, forKey: "activated")
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
    
  }
  
}
