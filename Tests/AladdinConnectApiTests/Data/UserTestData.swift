//
//  UserTestData.swift
//  
//
//  Created by Kevin Voell on 5/21/21.
//

import Alamofire
import Foundation
@testable import AladdinConnectApi
import Mocker
import SwiftDate

struct UserTestData {
  public static let name = "Test User"
  public static let email = "test@test.com"
  public static let password = "pass@word"
  public static let id = 123456
  public static let refreshToken = "123Refresh456"
  public static let accessToken = "456Access123"
  public static let deviceId = 554433
  public static let doorIndex1 = 1
  public static let doorIndex2 = 2
  
  public static let aladdinGetUserResponse = GetUserResponse(acceptTerms: true,
                                                             activated: true,
                                                             email: UserTestData.email,
                                                             id: UserTestData.id,
                                                             name: UserTestData.name)
  
  public static let authorizationResponse: [String : Any] = ["refresh_token": UserTestData.refreshToken,
                                                      "token_type":"bearer",
                                                      "expires_in":86400,
                                                      "scope":"operator",
                                                      "access_token": UserTestData.accessToken]
  
  public static let getUserResponse: [String: Any] = ["accept_terms": true,
                                                      "name": UserTestData.name,
                                                      "email": UserTestData.email,
                                                      "activated": true,
                                                      "id": UserTestData.id]
  
  public static let door = Door(batteryLevel: 4, bleStrength: 4, createdAt: "2021-5-10T12:10:00Z", desiredDoorStatus: "open", desiredDoorStatusOutcome: "open", desiredStatus: 4, deviceId: deviceId, doorIndex: doorIndex1, doorUpdatedAt: "2021-5-10T12:10:00Z".toDate()!, fault: 0, icon: 0, id: 0, isEnabled: true, linkStatus: 1, name: "Test Device", status: .closed, updatedAt: "2021-5-10T12:10:00Z".toDate()!, userId: 12, vehicleColor: "red", vehicleType: "Car", inviteId: 123, ownerEmail: "test@test.com")
  
  public static func setupAuthorizationSession() {
    let configuration = URLSessionConfiguration.af.default
    configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
    SessionManager.add(sessionType: .notAuthorized, session: Alamofire.Session(configuration: configuration, interceptor: AuthorizationInterceptor()))
  }
  
  public static let credentials = AuthCredentials(accessToken: UserTestData.accessToken,
                                                       refreshToken: UserTestData.refreshToken,
                                                       userEmail: UserTestData.email,
                                                       expiration: Date(timeIntervalSinceNow: 2600),
                                                       id: UserTestData.id)
  
  public static func setupAuthorizedSession() {
    let authenticator = AuthenticatedAuthenticator()
    let interceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                credential: UserTestData.credentials)
    
    let interceptors = Interceptor(adapters: [interceptor, RequestInterceptor(), RetryPolicy()])
    
    let configuration = URLSessionConfiguration.af.default
    configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
    
    let session = Session(configuration: configuration,
                          interceptor: interceptors)
    
    SessionManager.add(sessionType: .authorized, session: session)
  }
}
