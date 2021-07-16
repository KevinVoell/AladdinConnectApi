//
//  AuthCredentials.swift
//  AladdinConnectApi
//
//  Created by Kevin Voell on 5/16/21.
//

import Alamofire
import Foundation
import Security


/// Describes the credentials necessary to access the Aladdin Connect api.
public class AuthCredentials: AuthenticationCredential, Codable {
  public var accessToken: String?
  public var refreshToken: String?
  public var userEmail: String?
  public var id: Int?
  public var expiration: Date?
  
  // Require refresh if within 5 minutes of expiration
  public var requiresRefresh: Bool { Date(timeIntervalSinceNow: 60 * 5) > expiration ?? Date() }
  
  init(accessToken: String?, refreshToken: String?, userEmail: String?, expiration: Date?, id: Int?) {
    self.accessToken = accessToken
    self.refreshToken = refreshToken
    self.userEmail = userEmail
    self.expiration = expiration
    self.id = id
  }
}
