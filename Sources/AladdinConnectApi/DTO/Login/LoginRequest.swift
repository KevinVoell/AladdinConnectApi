//
//  LoginRequest.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on May 31, 2021

import Foundation
import SwiftyJSON


public class LoginRequest : Codable, Serializable {
  
  public var appVersion : String?
  public var brand : String?
  public var buildNumber : String?
  public var clientId : String?
  public var grantType : String?
  public var model : String?
  public var osVersion : String?
  public var password : String?
  public var platform : String?
  public var username : String?
  
  public init(appVersion: String, brand: String, buildNumber: String, clientId: String, grantType: String, model: String, osVersion: String, password: String, platform: String, username: String) {
    self.appVersion = appVersion
    self.brand = brand
    self.buildNumber = buildNumber
    self.clientId = clientId
    self.grantType = grantType
    self.model = model
    self.osVersion = osVersion
    self.password = password
    self.platform = platform
    self.username = username
  }
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    appVersion = json["app_version"].stringValue
    brand = json["brand"].stringValue
    buildNumber = json["build_number"].stringValue
    clientId = json["client_id"].stringValue
    grantType = json["grant_type"].stringValue
    model = json["model"].stringValue
    osVersion = json["os_version"].stringValue
    password = json["password"].stringValue
    platform = json["platform"].stringValue
    username = json["username"].stringValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if appVersion != nil{
      dictionary["app_version"] = appVersion
    }
    if brand != nil{
      dictionary["brand"] = brand
    }
    if buildNumber != nil{
      dictionary["build_number"] = buildNumber
    }
    if clientId != nil{
      dictionary["client_id"] = clientId
    }
    if grantType != nil{
      dictionary["grant_type"] = grantType
    }
    if model != nil{
      dictionary["model"] = model
    }
    if osVersion != nil{
      dictionary["os_version"] = osVersion
    }
    if password != nil{
      dictionary["password"] = password
    }
    if platform != nil{
      dictionary["platform"] = platform
    }
    if username != nil{
      dictionary["username"] = username
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    appVersion = aDecoder.decodeObject(forKey: "app_version") as? String
    brand = aDecoder.decodeObject(forKey: "brand") as? String
    buildNumber = aDecoder.decodeObject(forKey: "build_number") as? String
    clientId = aDecoder.decodeObject(forKey: "client_id") as? String
    grantType = aDecoder.decodeObject(forKey: "grant_type") as? String
    model = aDecoder.decodeObject(forKey: "model") as? String
    osVersion = aDecoder.decodeObject(forKey: "os_version") as? String
    password = aDecoder.decodeObject(forKey: "password") as? String
    platform = aDecoder.decodeObject(forKey: "platform") as? String
    username = aDecoder.decodeObject(forKey: "username") as? String
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if appVersion != nil{
      aCoder.encode(appVersion, forKey: "app_version")
    }
    if brand != nil{
      aCoder.encode(brand, forKey: "brand")
    }
    if buildNumber != nil{
      aCoder.encode(buildNumber, forKey: "build_number")
    }
    if clientId != nil{
      aCoder.encode(clientId, forKey: "client_id")
    }
    if grantType != nil{
      aCoder.encode(grantType, forKey: "grant_type")
    }
    if model != nil{
      aCoder.encode(model, forKey: "model")
    }
    if osVersion != nil{
      aCoder.encode(osVersion, forKey: "os_version")
    }
    if password != nil{
      aCoder.encode(password, forKey: "password")
    }
    if platform != nil{
      aCoder.encode(platform, forKey: "platform")
    }
    if username != nil{
      aCoder.encode(username, forKey: "username")
    }
    
  }
}
