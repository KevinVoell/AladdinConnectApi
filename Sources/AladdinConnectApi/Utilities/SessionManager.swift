//
//  SessionManager.swift
//  AladdinConnectApi
//
//  Created by Kevin Voell on 5/16/21.
//

import Alamofire
import Foundation

enum SessionType {
  case authorized
  case notAuthorized
}

/// Manager for Alamofire sessions.
internal class SessionManager {
  /// Holds the current Alamofire sessions.
  private static var sessions: [SessionType: Session] = [:]
  
  /// Finds a session by session name.
  public static subscript(sessionType: SessionType) -> Session? {
    return sessions[sessionType]
  }
  
  /// Adds a new session to the session manager.
  /// - Parameters:
  ///   - sessionName: The name of the session.
  ///   - session: The Alamofire session to add.
  public static func add(sessionType: SessionType, session: Session) {
    sessions[sessionType] = session
  }
  
  /// Removes a session from the session manager.
  /// - Parameter sessionName: The name of the session to remove.
  public static func remove(sessionType: SessionType) {
    sessions.removeValue(forKey: sessionType)
  }
}
