//
//  File.swift
//  
//
//  Created by Kevin Voell on 6/8/21.
//

import Foundation
import Logging
import SwiftyJSON

public class InviteApi: Api {
  /// Optional logger to write logs to
  public var logger: Logger?
  
  init(logger: Logger? = nil) {
    self.logger = logger
  }
  
  public func accept(inviteId: Int, completion: @escaping (Result<InviteResponse, AladdinError>) -> Void) {
    self.inviteAction(inviteId: inviteId, action: .accept, completion: completion)
  }
  
  public func decline(inviteId: Int, completion: @escaping (Result<InviteResponse, AladdinError>) -> Void) {
    self.inviteAction(inviteId: inviteId, action: .decline, completion: completion)
  }
  
  public func inviteAction(inviteId: Int, action: InviteAction, completion: @escaping (Result<InviteResponse, AladdinError>) -> Void) {
    let request = InviteRequest(action: action)
    
    if let baseURL = URL(string: Constants.ENDPOINT_ADDRESS) {
      
      let jsonURL = baseURL.appendingPathComponent(Constants.PATH_INVITES)
        .appendingPathComponent("\(inviteId)")
        .appendingPathComponent("action")
      
      if let session = SessionManager[.authorized] {
        session.putJSON(jsonURL, body: request) { json in
          
          // Capture the session object, so it doesn't get deallocated
          // not sure why this is necessary, but if it's not captured
          // then deinit is called on it
          let _ = session
          
          switch json.result {
          case let .success(response):
            let statusResponse = InviteResponse.init(fromJson: JSON(response))
            completion(.success(statusResponse))
            
          case let .failure(error):
            // TODO: Clean this up
            if let data = json.data,
               let json = try? JSON.init(data: data),
               let msg = json["error"].string {
              
              self.logger?.info("\(msg)")
              completion(.failure(AladdinError.notAuthorized(msg)))
            } else {
              self.logger?.error("Request to action invite failed.", metadata: ["Error": "\(error)"])
              completion(.failure(AladdinError.unknown("Invite action failed")))
            }
          }
        }
      }
    }
  }
}
