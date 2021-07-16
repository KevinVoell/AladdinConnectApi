//
//  File.swift
//  
//
//  Created by Kevin Voell on 6/9/21.
//

import Foundation
import Logging
import SwiftyJSON

public class DeviceApi : Api {
  
  /// Optional logger to write logs to
  public var logger: Logger?
  
  /// Initialize a new instance of the AladdinConnect user class
  public init(logger: Logger? = nil) {
    self.logger = logger
    
    logger?.debug("Initializing AladdinApi Device instance")
  }
  
  /// Calls the Aladdin Connect api to set the status (open/close) of a device
  /// - Parameters:
  ///   - door: The Door object to send the command to
  ///   - command: The command to send
  ///   - completion: Method to call when call is complete
  public func setStatus(_ door: Door, inviteId: Int? = nil, command: DoorCommands, completion: @escaping (Result<SetStatusResponse, AladdinError>) -> Void ) {
    
    let request = SetStatusRequest(commandKey: command.rawValue, inviteId: inviteId)
    
    if let baseURL = URL(string: Constants.ENDPOINT_ADDRESS) {
      
      guard let deviceId = door.deviceId,
            let doorIndex = door.doorIndex else {
        self.logger?.error("DeviceId or DoorIndex not set")
        completion(.failure(AladdinError.unknown("DeviceId or DoorIndex not set")))
        return
      }
      
      let jsonURL = baseURL.appendingPathComponent(Constants.PATH_DEVICES)
        .appendingPathComponent("\(deviceId)")
        .appendingPathComponent("door")
        .appendingPathComponent("\(doorIndex)")
        .appendingPathComponent("command")
      
      if let session = SessionManager[.authorized] {
        session.postJSON(jsonURL, body: request) { json in
          
          // Capture the session object, so it doesn't get deallocated
          // not sure why this is necessary, but if it's not captured
          // then deinit is called on it
          let _ = session
          
          switch json.result {
          case let .success(response):
            let statusResponse = SetStatusResponse.init(fromJson: JSON(response))
            guard let message = statusResponse.message else {
              self.logger?.info("message not received")
              return
            }
            
            if message == Constants.DOOR_COMMAND_MESSAGE_SUCCESS {
              self.logger?.debug("\(message)")
            }
            completion(.success(statusResponse))
            
          case let .failure(error):
            // TODO: Clean this up
            if let data = json.data,
               let json = try? JSON.init(data: data),
               let msg = json["error"].string {
              
              self.logger?.info("\(msg)")
              completion(.failure(AladdinError.notAuthorized(msg)))
            } else {
              self.logger?.error("Request to set status failed.", metadata: ["Error": "\(error)"])
              completion(.failure(AladdinError.unknown("Door could not be opened")))
            }
          }
        }
      }
    }
  }
  
  /// Gets the status of all doors on a specific device
  /// - Parameters:
  ///   - device: The device to query
  ///   - model: The model to update after the status has been retrieved
  ///   - completion: The code to call after the status has been retrieved
  public func getStatus(_ device: Device, completion: @escaping (Result<GetStatusResponse, AladdinError>) -> Void) {
    self.logger?.debug("Updating status \(Date())")
    
    if let baseURL = URL(string: Constants.ENDPOINT_ADDRESS),
       let deviceId = device.id {
      
      let url = baseURL.appendingPathComponent(Constants.PATH_DEVICES)
        .appendingPathComponent("\(deviceId)")
      
      if let session = SessionManager[.authorized] {
        session.getJSON(url) { json in
          
          // Capture the session object, so it doesn't get deallocated
          // not sure why this is necessary, but if it's not captured
          // then deinit is called on it
          let _ = session
          
          switch json.result {
          case let .success(response):
            let statusResponse = GetStatusResponse.init(fromJson: JSON(response))
            completion(.success(statusResponse))
            
          case let .failure(error):
            self.logger?.error("Request to get status failed.", metadata: ["Error": "\(error)"])
            
            completion(.failure(AladdinError.unknown("Get status failed")))
          }
        }
      }
    }
  }
}
