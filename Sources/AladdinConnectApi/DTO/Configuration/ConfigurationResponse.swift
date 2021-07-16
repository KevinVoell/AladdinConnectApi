//
//  ConfigurationResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftyJSON

public enum RefreshStatus: String, Codable {
  case success = "success"
}

public class ConfigurationResponse : Codable {
  
  public var devices : [Device]?
  public var invites : Invite?
  public var locations : [Location]?
  public var message : String?
  public var refreshStatus : RefreshStatus?
  public var rules : [Rule]?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    devices = [Device]()
    let devicesArray = json["devices"].arrayValue
    for devicesJson in devicesArray{
      let value = Device(fromJson: devicesJson)
      devices?.append(value)
    }
    let invitesJson = json["invites"]
    if !invitesJson.isEmpty{
      invites = Invite(fromJson: invitesJson)
    }
    locations = [Location]()
    let locationsArray = json["locations"].arrayValue
    for locationsJson in locationsArray{
      let value = Location(fromJson: locationsJson)
      locations?.append(value)
    }
    message = json["message"].stringValue
    refreshStatus = RefreshStatus.init(rawValue: json["refresh_status"].stringValue)
    rules = [Rule]()
    let rulesArray = json["rules"].arrayValue
    for rulesJson in rulesArray{
      let value = Rule(fromJson: rulesJson)
      rules?.append(value)
    }
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if let devices = self.devices {
      var dictionaryElements = [[String:Any]]()
      for devicesElement in devices {
        dictionaryElements.append(devicesElement.toDictionary())
      }
      dictionary["devices"] = dictionaryElements
    }
    if invites != nil{
      dictionary["invites"] = invites?.toDictionary()
    }
    if let locations = self.locations{
      var dictionaryElements = [[String:Any]]()
      for locationsElement in locations {
        dictionaryElements.append(locationsElement.toDictionary())
      }
      dictionary["locations"] = dictionaryElements
    }
    if message != nil{
      dictionary["message"] = message
    }
    if refreshStatus != nil{
      dictionary["refresh_status"] = refreshStatus
    }
    if let rules = self.rules {
      var dictionaryElements = [[String:Any]]()
      for rulesElement in rules {
        dictionaryElements.append(rulesElement.toDictionary())
      }
      dictionary["rules"] = dictionaryElements
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    devices = aDecoder.decodeObject(forKey: "devices") as? [Device]
    invites = aDecoder.decodeObject(forKey: "invites") as? Invite
    locations = aDecoder.decodeObject(forKey: "locations") as? [Location]
    message = aDecoder.decodeObject(forKey: "message") as? String
    refreshStatus = aDecoder.decodeObject(forKey: "refresh_status") as? RefreshStatus
    rules = aDecoder.decodeObject(forKey: "rules") as? [Rule]
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if devices != nil{
      aCoder.encode(devices, forKey: "devices")
    }
    if invites != nil{
      aCoder.encode(invites, forKey: "invites")
    }
    if locations != nil{
      aCoder.encode(locations, forKey: "locations")
    }
    if message != nil{
      aCoder.encode(message, forKey: "message")
    }
    if refreshStatus != nil{
      aCoder.encode(refreshStatus, forKey: "refresh_status")
    }
    if rules != nil{
      aCoder.encode(rules, forKey: "rules")
    }
    
  }
  
}
