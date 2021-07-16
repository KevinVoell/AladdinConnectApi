//
//  RefreshTokenRequest.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on May 31, 2021

import Foundation
import SwiftyJSON


public class RefreshTokenRequest : Codable, Serializable {
  
  public var brand : String?
  public var clientId : String?
  public var clientSecret : String?
  public var grantType : String?
  public var platform : String?
  public var refreshToken : String?
  
  public init(brand: String, clientId: String, clientSecret: String, grantType: String, platform: String, refreshToken: String) {
    self.brand = brand
    self.clientId = clientId
    self.clientSecret = clientSecret
    self.grantType = grantType
    self.platform = platform
    self.refreshToken = refreshToken
  }
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    brand = json["brand"].stringValue
    clientId = json["client_id"].stringValue
    clientSecret = json["client_secret"].stringValue
    grantType = json["grant_type"].stringValue
    platform = json["platform"].stringValue
    refreshToken = json["refresh_token"].stringValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if brand != nil{
      dictionary["brand"] = brand
    }
    if clientId != nil{
      dictionary["client_id"] = clientId
    }
    if clientSecret != nil{
      dictionary["client_secret"] = clientSecret
    }
    if grantType != nil{
      dictionary["grant_type"] = grantType
    }
    if platform != nil{
      dictionary["platform"] = platform
    }
    if refreshToken != nil{
      dictionary["refresh_token"] = refreshToken
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    brand = aDecoder.decodeObject(forKey: "brand") as? String
    clientId = aDecoder.decodeObject(forKey: "client_id") as? String
    clientSecret = aDecoder.decodeObject(forKey: "client_secret") as? String
    grantType = aDecoder.decodeObject(forKey: "grant_type") as? String
    platform = aDecoder.decodeObject(forKey: "platform") as? String
    refreshToken = aDecoder.decodeObject(forKey: "refresh_token") as? String
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if brand != nil{
      aCoder.encode(brand, forKey: "brand")
    }
    if clientId != nil{
      aCoder.encode(clientId, forKey: "client_id")
    }
    if clientSecret != nil{
      aCoder.encode(clientSecret, forKey: "client_secret")
    }
    if grantType != nil{
      aCoder.encode(grantType, forKey: "grant_type")
    }
    if platform != nil{
      aCoder.encode(platform, forKey: "platform")
    }
    if refreshToken != nil{
      aCoder.encode(refreshToken, forKey: "refresh_token")
    }
    
  }
  
}
