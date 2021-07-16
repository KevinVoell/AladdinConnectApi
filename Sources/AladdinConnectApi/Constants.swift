//
//  Constants.swift
//  AladdinConnectApi
//
//  Created by Kevin Voell on 4/30/21.
//

import Foundation

struct Constants {
  public static let ENDPOINT_ADDRESS = "https://16375mc41i.execute-api.us-east-1.amazonaws.com"
  
  public static let PATH_LOGIN = "/IOS/oauth/token"
  public static let PATH_CONFIGURATION = "/IOS/configuration"
  public static let PATH_DEVICES = "/IOS/devices"
  public static let PATH_INVITES = "/IOS/invites"
  public static let PATH_COMMAND = "\(PATH_DEVICES)/%@/door/%@/command"
  public static let PATH_USER = "/IOS/user"
  
  /// Gets the full path for login
  public static let URL_LOGIN = "\(Constants.ENDPOINT_ADDRESS)\(Constants.PATH_LOGIN)"
  
  /// Gets the full path for the user
  public static let URL_USER = "\(Constants.ENDPOINT_ADDRESS)\(Constants.PATH_USER)"
  
  public static let CLIENT_SECRET = "6081EBE9A52091D420CD04125D12BDC5"
  public static let X_API_KEY = "2BcHhgzjAa58BXkpbYM977jFvr3pJUhH52nflMuS"
  
  public static let USER_AGENT = "Aladdin%20Connect/37 CFNetwork/1220.1 Darwin/20.3.0"
  
  public static let DOOR_STATUS_OPEN = 1
  public static let DOOR_STATUS_CLOSED = 4
  
  public static let DOOR_COMMAND_MESSAGE_SUCCESS = "Device command created."

}
