//
//  Invite.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation
import SwiftyJSON


public class Invite : Codable, Identifiable {
  
  public var recv : [Recv]?
  public var sent : [Sent]?
  public var settings : Setting?
  
  /**
   * Instantiate the instance using the passed json values to set the properties values
   */
  public init(fromJson json: JSON!){
    if json.isEmpty{
      return
    }
    recv = [Recv]()
    let recvArray = json["recv"].arrayValue
    for recvJson in recvArray{
      let value = Recv(fromJson: recvJson)
      recv?.append(value)
    }
    sent = [Sent]()
    let sentArray = json["sent"].arrayValue
    for sentJson in sentArray{
      let value = Sent(fromJson: sentJson)
      sent?.append(value)
    }
    let settingsJson = json["settings"]
    if !settingsJson.isEmpty{
      settings = Setting(fromJson: settingsJson)
    }
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  public func toDictionary() -> [String:Any]
  {
    var dictionary = [String:Any]()
    if let recv = self.recv {
      var dictionaryElements = [[String:Any]]()
      for recvElement in recv {
        dictionaryElements.append(recvElement.toDictionary())
      }
      dictionary["recv"] = dictionaryElements
    }
    if let sent = self.sent {
      var dictionaryElements = [[String:Any]]()
      for sentElement in sent {
        dictionaryElements.append(sentElement.toDictionary())
      }
      dictionary["sent"] = dictionaryElements
    }
    if settings != nil{
      dictionary["settings"] = settings?.toDictionary()
    }
    return dictionary
  }
  
  /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
  @objc public required init(coder aDecoder: NSCoder)
  {
    recv = aDecoder.decodeObject(forKey: "recv") as? [Recv]
    sent = aDecoder.decodeObject(forKey: "sent") as? [Sent]
    settings = aDecoder.decodeObject(forKey: "settings") as? Setting
  }
  
  /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
  public func encode(with aCoder: NSCoder)
  {
    if recv != nil{
      aCoder.encode(recv, forKey: "recv")
    }
    if sent != nil{
      aCoder.encode(sent, forKey: "sent")
    }
    if settings != nil{
      aCoder.encode(settings, forKey: "settings")
    }
    
  }
  
}
