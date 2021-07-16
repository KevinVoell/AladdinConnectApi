//
//  File.swift
//  
//
//  Created by Kevin Voell on 5/20/21.
//

import Foundation
import Logging
@testable import AladdinConnectApi

class UserApiMock: UserApi {

  convenience init() {
    self.init(logger: nil)
  }

  var invokedLoggerSetter = false
  var invokedLoggerSetterCount = 0
  var invokedLogger: Logger?
  var invokedLoggerList = [Logger?]()
  var invokedLoggerGetter = false
  var invokedLoggerGetterCount = 0
  var stubbedLogger: Logger!
  var forwardToOriginalLogger = false

  override var logger: Logger? {
    set {
      invokedLoggerSetter = true
      invokedLoggerSetterCount += 1
      invokedLogger = newValue
      invokedLoggerList.append(newValue)
      if forwardToOriginalLogger {
        super.logger = newValue
      }
    }
    get {
      invokedLoggerGetter = true
      invokedLoggerGetterCount += 1
      if forwardToOriginalLogger {
        return super.logger
      }
      return stubbedLogger
    }
  }

  var invokedCurrentLoginStatusSetter = false
  var invokedCurrentLoginStatusSetterCount = 0
  var invokedCurrentLoginStatus: LoginStatus?
  var invokedCurrentLoginStatusList = [LoginStatus]()
  var invokedCurrentLoginStatusGetter = false
  var invokedCurrentLoginStatusGetterCount = 0
  var stubbedCurrentLoginStatus: LoginStatus!
  var forwardToOriginalCurrentLoginStatus = false

  override var currentLoginStatus: LoginStatus {
    set {
      invokedCurrentLoginStatusSetter = true
      invokedCurrentLoginStatusSetterCount += 1
      invokedCurrentLoginStatus = newValue
      invokedCurrentLoginStatusList.append(newValue)
      if forwardToOriginalCurrentLoginStatus {
        super.currentLoginStatus = newValue
      }
    }
    get {
      invokedCurrentLoginStatusGetter = true
      invokedCurrentLoginStatusGetterCount += 1
      if forwardToOriginalCurrentLoginStatus {
        return super.currentLoginStatus
      }
      return stubbedCurrentLoginStatus
    }
  }

  var invokedOnLoadCredentialsInternalSetter = false
  var invokedOnLoadCredentialsInternalSetterCount = 0
  var invokedOnLoadCredentialsInternal: (() -> AuthCredentials?)?
  var invokedOnLoadCredentialsInternalList = [() -> AuthCredentials?]()
  var invokedOnLoadCredentialsInternalGetter = false
  var invokedOnLoadCredentialsInternalGetterCount = 0
  var stubbedOnLoadCredentialsInternal: (() -> AuthCredentials?)! = { return nil }
  var forwardToOriginalOnLoadCredentialsInternal = false

  override var onLoadCredentialsInternal: () -> AuthCredentials? {
    set {
      invokedOnLoadCredentialsInternalSetter = true
      invokedOnLoadCredentialsInternalSetterCount += 1
      invokedOnLoadCredentialsInternal = newValue
      invokedOnLoadCredentialsInternalList.append(newValue)
      if forwardToOriginalOnLoadCredentialsInternal {
        super.onLoadCredentialsInternal = newValue
      }
    }
    get {
      invokedOnLoadCredentialsInternalGetter = true
      invokedOnLoadCredentialsInternalGetterCount += 1
      if forwardToOriginalOnLoadCredentialsInternal {
        return super.onLoadCredentialsInternal
      }
      return stubbedOnLoadCredentialsInternal
    }
  }

  var invokedOnSaveCredentialsInternalSetter = false
  var invokedOnSaveCredentialsInternalSetterCount = 0
  var invokedOnSaveCredentialsInternal: ((AuthCredentials) -> Void)?
  var invokedOnSaveCredentialsInternalList = [(AuthCredentials) -> Void]()
  var invokedOnSaveCredentialsInternalGetter = false
  var invokedOnSaveCredentialsInternalGetterCount = 0
  var stubbedOnSaveCredentialsInternal: ((AuthCredentials) -> Void)! = { _ in }
  var forwardToOriginalOnSaveCredentialsInternal = false

  override var onSaveCredentialsInternal: (AuthCredentials) -> Void {
    set {
      invokedOnSaveCredentialsInternalSetter = true
      invokedOnSaveCredentialsInternalSetterCount += 1
      invokedOnSaveCredentialsInternal = newValue
      invokedOnSaveCredentialsInternalList.append(newValue)
      if forwardToOriginalOnSaveCredentialsInternal {
        super.onSaveCredentialsInternal = newValue
      }
    }
    get {
      invokedOnSaveCredentialsInternalGetter = true
      invokedOnSaveCredentialsInternalGetterCount += 1
      if forwardToOriginalOnSaveCredentialsInternal {
        return super.onSaveCredentialsInternal
      }
      return stubbedOnSaveCredentialsInternal
    }
  }

  var invokedOnClearCredentialsInternalSetter = false
  var invokedOnClearCredentialsInternalSetterCount = 0
  var invokedOnClearCredentialsInternal: (() -> Void)?
  var invokedOnClearCredentialsInternalList = [() -> Void]()
  var invokedOnClearCredentialsInternalGetter = false
  var invokedOnClearCredentialsInternalGetterCount = 0
  var stubbedOnClearCredentialsInternal: (() -> Void)! = {}
  var forwardToOriginalOnClearCredentialsInternal = false

  override var onClearCredentialsInternal: () -> Void {
    set {
      invokedOnClearCredentialsInternalSetter = true
      invokedOnClearCredentialsInternalSetterCount += 1
      invokedOnClearCredentialsInternal = newValue
      invokedOnClearCredentialsInternalList.append(newValue)
      if forwardToOriginalOnClearCredentialsInternal {
        super.onClearCredentialsInternal = newValue
      }
    }
    get {
      invokedOnClearCredentialsInternalGetter = true
      invokedOnClearCredentialsInternalGetterCount += 1
      if forwardToOriginalOnClearCredentialsInternal {
        return super.onClearCredentialsInternal
      }
      return stubbedOnClearCredentialsInternal
    }
  }

  var invokedUserEmailGetter = false
  var invokedUserEmailGetterCount = 0
  var stubbedUserEmail: String! = ""
  var forwardToOriginalUserEmail = false

  override var userEmail: String {
    invokedUserEmailGetter = true
    invokedUserEmailGetterCount += 1
    if forwardToOriginalUserEmail {
      return super.userEmail
    }
    return stubbedUserEmail
  }

  var invokedUserIdGetter = false
  var invokedUserIdGetterCount = 0
  var stubbedUserId: Int! = 0
  var forwardToOriginalUserId = false

  override var userId: Int {
    invokedUserIdGetter = true
    invokedUserIdGetterCount += 1
    if forwardToOriginalUserId {
      return super.userId
    }
    return stubbedUserId
  }

  var invokedOnLoadCredentials = false
  var invokedOnLoadCredentialsCount = 0
  var shouldInvokeOnLoadCredentialsCompletion = false
  var forwardToOriginalOnLoadCredentials = false

  override func onLoadCredentials(_ completion: @escaping () -> AuthCredentials?) {
    invokedOnLoadCredentials = true
    invokedOnLoadCredentialsCount += 1
    if forwardToOriginalOnLoadCredentials {
      super.onLoadCredentials(completion)
      return
    }
    if shouldInvokeOnLoadCredentialsCompletion {
      _ = completion()
    }
  }

  var invokedOnSaveCredentials = false
  var invokedOnSaveCredentialsCount = 0
  var stubbedOnSaveCredentialsCompletionResult: (AuthCredentials, Void)?
  var forwardToOriginalOnSaveCredentials = false

  override func onSaveCredentials(_ completion: @escaping (AuthCredentials) -> Void) {
    invokedOnSaveCredentials = true
    invokedOnSaveCredentialsCount += 1
    if forwardToOriginalOnSaveCredentials {
      super.onSaveCredentials(completion)
      return
    }
    if let result = stubbedOnSaveCredentialsCompletionResult {
      completion(result.0)
    }
  }

  var invokedOnClearCredentials = false
  var invokedOnClearCredentialsCount = 0
  var shouldInvokeOnClearCredentialsCompletion = false
  var forwardToOriginalOnClearCredentials = false

  override func onClearCredentials(_ completion: @escaping () -> Void) {
    invokedOnClearCredentials = true
    invokedOnClearCredentialsCount += 1
    if forwardToOriginalOnClearCredentials {
      super.onClearCredentials(completion)
      return
    }
    if shouldInvokeOnClearCredentialsCompletion {
      completion()
    }
  }

  var invokedOnLoginStatusChanged = false
  var invokedOnLoginStatusChangedCount = 0
  var stubbedOnLoginStatusChangedCompletionResult: (LoginStatus, LoginStatus)?
  var forwardToOriginalOnLoginStatusChanged = false

  override func onLoginStatusChanged(_ completion: @escaping (LoginStatus, LoginStatus) -> Void) {
    invokedOnLoginStatusChanged = true
    invokedOnLoginStatusChangedCount += 1
    if forwardToOriginalOnLoginStatusChanged {
      super.onLoginStatusChanged(completion)
      return
    }
    if let result = stubbedOnLoginStatusChangedCompletionResult {
      completion(result.0, result.1)
    }
  }

  var invokedLoadCachedCredentials = false
  var invokedLoadCachedCredentialsCount = 0
  var forwardToOriginalLoadCachedCredentials = false

  override func loadCachedCredentials() {
    invokedLoadCachedCredentials = true
    invokedLoadCachedCredentialsCount += 1
    if forwardToOriginalLoadCachedCredentials {
      super.loadCachedCredentials()
      return
    }
  }

  var invokedCreateNotAuthorizedSession = false
  var invokedCreateNotAuthorizedSessionCount = 0
  var forwardToOriginalCreateNotAuthorizedSession = false

  override func createNotAuthorizedSession() {
    invokedCreateNotAuthorizedSession = true
    invokedCreateNotAuthorizedSessionCount += 1
    if forwardToOriginalCreateNotAuthorizedSession {
      super.createNotAuthorizedSession()
      return
    }
  }

  var invokedLogout = false
  var invokedLogoutCount = 0
  var forwardToOriginalLogout = false

  override func logout() {
    invokedLogout = true
    invokedLogoutCount += 1
    if forwardToOriginalLogout {
      super.logout()
      return
    }
  }

  var invokedLoggedIn = false
  var invokedLoggedInCount = 0
  var forwardToOriginalLoggedIn = false

  override func loggedIn() {
    invokedLoggedIn = true
    invokedLoggedInCount += 1
    if forwardToOriginalLoggedIn {
      super.loggedIn()
      return
    }
  }

  var invokedCreateAuthorizedSession = false
  var invokedCreateAuthorizedSessionCount = 0
  var invokedCreateAuthorizedSessionParameters: (credentials: AuthCredentials, Void)?
  var invokedCreateAuthorizedSessionParametersList = [(credentials: AuthCredentials, Void)]()
  var forwardToOriginalCreateAuthorizedSession = false

  override func createAuthorizedSession(_ credentials: AuthCredentials) {
    invokedCreateAuthorizedSession = true
    invokedCreateAuthorizedSessionCount += 1
    invokedCreateAuthorizedSessionParameters = (credentials, ())
    invokedCreateAuthorizedSessionParametersList.append((credentials, ()))
    if forwardToOriginalCreateAuthorizedSession {
      super.createAuthorizedSession(credentials)
      return
    }
  }

  var invokedLogin = false
  var invokedLoginCount = 0
  var invokedLoginParameters: (username: String, password: String)?
  var invokedLoginParametersList = [(username: String, password: String)]()
  var stubbedLoginCompletionResult: (Result<GetUserResponse, AladdinError>, Void)?
  var forwardToOriginalLogin = false

  override func login(username: String, password: String, completion: @escaping (Result<GetUserResponse, AladdinError>) -> Void) {
    invokedLogin = true
    invokedLoginCount += 1
    invokedLoginParameters = (username, password)
    invokedLoginParametersList.append((username, password))
    if forwardToOriginalLogin {
      super.login(username: username, password: password, completion: completion)
      return
    }
    if let result = stubbedLoginCompletionResult {
      completion(result.0)
    }
  }

  var invokedGetUser = false
  var invokedGetUserCount = 0
  var stubbedGetUserCompletionResult: (Result<GetUserResponse, Error>, Void)?
  var forwardToOriginalGetUser = false

  override func getUser(completion: @escaping (Result<GetUserResponse, Error>) -> Void) {
    invokedGetUser = true
    invokedGetUserCount += 1
    if forwardToOriginalGetUser {
      super.getUser(completion: completion)
      return
    }
    if let result = stubbedGetUserCompletionResult {
      completion(result.0)
    }
  }
}
