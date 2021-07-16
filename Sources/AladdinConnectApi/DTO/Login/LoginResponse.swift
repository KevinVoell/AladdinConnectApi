//
//  LoginResponse.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on May 30, 2021

import Foundation
import SwiftyJSON


public class LoginResponse : Codable {
  
  public var accessToken : String?
  public var expiresIn : Int?
  public var refreshToken : String?
  public var scope : String?
  public var tokenType : String?
  public var expiresAt: Double?
  public var user: GetUserResponse?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    accessToken = json["access_token"].stringValue
    expiresIn = json["expires_in"].intValue
    refreshToken = json["refresh_token"].stringValue
    scope = json["scope"].stringValue
    tokenType = json["token_type"].stringValue
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if accessToken != nil{
      dictionary["access_token"] = accessToken
    }
    if expiresIn != nil{
      dictionary["expires_in"] = expiresIn
    }
    if refreshToken != nil{
      dictionary["refresh_token"] = refreshToken
    }
    if scope != nil{
      dictionary["scope"] = scope
    }
    if tokenType != nil{
      dictionary["token_type"] = tokenType
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    accessToken = aDecoder.decodeObject(forKey: "access_token") as? String
    expiresIn = aDecoder.decodeObject(forKey: "expires_in") as? Int
    refreshToken = aDecoder.decodeObject(forKey: "refresh_token") as? String
    scope = aDecoder.decodeObject(forKey: "scope") as? String
    tokenType = aDecoder.decodeObject(forKey: "token_type") as? String
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if accessToken != nil{
      aCoder.encode(accessToken, forKey: "access_token")
    }
    if expiresIn != nil{
      aCoder.encode(expiresIn, forKey: "expires_in")
    }
    if refreshToken != nil{
      aCoder.encode(refreshToken, forKey: "refresh_token")
    }
    if scope != nil{
      aCoder.encode(scope, forKey: "scope")
    }
    if tokenType != nil{
      aCoder.encode(tokenType, forKey: "token_type")
    }
    
  }
  
  public func expiresAtDate() -> Date {
    if let expiresIn = self.expiresIn {
      return Date().addingTimeInterval(Double(expiresIn))
    }
    
    return Date()
  }
  
  public func updateExpiresAt() {
    if let expiresIn = self.expiresIn {
      self.expiresAt = Date().addingTimeInterval(Double(expiresIn)).timeIntervalSince1970
    }
  }
  
  public func isExpired() -> Bool {
    guard let expiresAt = self.expiresAt else {
      return true
    }
    return Date().timeIntervalSince1970 > expiresAt
  }
  
}
