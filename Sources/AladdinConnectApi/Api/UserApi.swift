//
//  Login.swift
//  AladdinConnectApi
//
//  Created by Kevin Voell on 4/30/21.
//

import Alamofire
import Foundation
import Logging
import SwiftyJSON

/// Indicates the users login status
public enum LoginStatus {
  case NotLoggedIn
  case LoggedIn
}

/// The AladdinUser class represents a user in the Aladdin api.
public class UserApi: Api {
  
  /// Optional logger to write logs to
  public var logger: Logger?
  
  /// The users current login status
  public internal(set) var currentLoginStatus: LoginStatus = .NotLoggedIn
  
  internal var onLoadCredentialsInternal: () -> AuthCredentials? = { return nil }
  internal var onSaveCredentialsInternal: (AuthCredentials) -> Void = { credentials in }
  internal var onClearCredentialsInternal: () -> Void = { }
  internal var onLoginStatusChangedInternal: [(_ from: LoginStatus, _ to: LoginStatus) -> Void] = [{ (from, to) in }]
  
  /// Returns the name for the currently logged in user
  public var userEmail: String {
    get {
      if let session = SessionManager[.authorized],
         let interceptor = session.interceptor as? Interceptor,
         let authInterceptor = interceptor.adapters[0] as? AuthenticationInterceptor<AuthenticatedAuthenticator>,
         let credentials = authInterceptor.credential,
         let userEmail = credentials.userEmail {
        return userEmail
      }
      
      return ""
    }
  }
  
  /// Returns the id for the currently logged in user
  public var userId: Int {
    get {
      if let session = SessionManager[.authorized],
         let interceptor = session.interceptor as? Interceptor,
         let authInterceptor = interceptor.adapters[0] as? AuthenticationInterceptor<AuthenticatedAuthenticator>,
         let credentials = authInterceptor.credential,
         let userId = credentials.id {
        return userId
      }
      
      return 0
    }
  }
  
  /// Initialize a new instance of the AladdinConnect user class
  public init(logger: Logger? = nil) {
    self.logger = logger
    
    logger?.debug("Initializing AladdinApi User instance")
    
    self.createNotAuthorizedSession()
  }
  
  public func onLoadCredentials(_ completion: @escaping () -> AuthCredentials?) {
    self.onLoadCredentialsInternal = completion
  }
  
  public func onSaveCredentials(_ completion: @escaping (AuthCredentials) -> Void) {
    self.onSaveCredentialsInternal = completion
  }
  
  public func onClearCredentials(_ completion: @escaping () -> Void) {
    self.onClearCredentialsInternal = completion
  }
  
  public func onLoginStatusChanged(_ completion: @escaping (LoginStatus, LoginStatus) -> Void) {
    self.onLoginStatusChangedInternal.insert(completion, at: 0)
  }
  
  public func loadCachedCredentials() {
    if let credentials = self.onLoadCredentialsInternal() {
      self.logger?.debug("Cached credentials found")
      
      self.createAuthorizedSession(credentials)
      
      loggedIn()
    }
  }
  
  /// Creates an Alamofire session for not authenticated requests, like login
  internal func createNotAuthorizedSession() {
    let session = Session(configuration: URLSessionConfiguration.af.default,
                          interceptor: AuthorizationInterceptor())
    
    SessionManager.add(sessionType: .notAuthorized, session: session)
  }
  
  /// Logs the current user out and displays the login page
  public func logout() {
    self.logger?.debug("User is logging out")
    
    self.onClearCredentialsInternal()
    
    SessionManager.remove(sessionType: .authorized)
    let currentStatus = self.currentLoginStatus
    self.currentLoginStatus = .NotLoggedIn
    for handler in self.onLoginStatusChangedInternal {
      handler(currentStatus, self.currentLoginStatus)
    }
  }
  
  /// Handle a successful login
  internal func loggedIn() {
    self.logger?.debug("User is logged in")
    
    let currentStatus = self.currentLoginStatus
    self.currentLoginStatus = .LoggedIn
    for handler in self.onLoginStatusChangedInternal {
      handler(currentStatus, self.currentLoginStatus)
    }
  }
  
  /// Creates a session for authorized calls
  /// - Parameter credentials: The credentials to use for authorization
  internal func createAuthorizedSession(_ credentials: AuthCredentials) {
    self.logger?.debug("Creating authorized session")
    
    // Create the interceptor
    let authenticator = AuthenticatedAuthenticator(logger: self.logger, user: self)
    let interceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                credential: credentials)
    
    let interceptors = Interceptor(adapters: [interceptor, RequestInterceptor(), RetryPolicy()])
    
    let session = Session(configuration: URLSessionConfiguration.af.default,
                          interceptor: interceptors)
    
    SessionManager.add(sessionType: .authorized, session: session)
  }
  
  /// Attempts to login to the Aladdin Connect api
  /// - Parameters:
  ///   - username: The username to login as
  ///   - password: The users password
  ///   - completion: Callback
  public func login(username: String, password: String, completion: @escaping (Result<GetUserResponse, AladdinError>) -> Void) {
    self.logger?.info("Attempting to login user")
    
    let request = LoginRequest(appVersion: "4.41",
                                 brand: "ALADDIN",
                                 buildNumber: "37",
                                 clientId: "1000",
                                 grantType: "password",
                                 model: "iPad6,7",
                                 osVersion: "14.4.2",
                                 password: password.toBase64(),
                                 platform: "IOS", username: username)
    
    if let session = SessionManager[.notAuthorized] {
      session.postURLEncoded(Constants.URL_LOGIN, body: request) { json in
        
        // Capture the session object, so it doesn't get deallocated
        // not sure why this is necessary, but if it's not captured
        // then deinit is called on it
        let _ = session
        
          switch json.result {
          case let .success(response):
            self.logger?.info("Request to login user succeeded")
            
            let loginResponse = LoginResponse.init(fromJson: JSON(response))
            
            let credentials = AuthCredentials(accessToken: loginResponse.accessToken,
                                              refreshToken: loginResponse.refreshToken,
                                              userEmail: "",
                                              expiration: loginResponse.expiresAtDate(),
                                              id: nil)
            
            self.createAuthorizedSession(credentials)
            
            self.getUser { (response: Result<GetUserResponse, Error>) in
              switch response {
              case .success(let response):
                credentials.userEmail = response.email
                credentials.id = response.id
                completion(.success(response))
                self.loggedIn()
                
              case .failure(_):
                completion(.failure(AladdinError.loginFailed))
              }
            }
            
          case let .failure(error):
            self.logger?.error("Request to login user failed.", metadata: ["Error": "\(error)"])
            
            completion(.failure(AladdinError.loginFailed))
          }
        }
    }
  }
  
  /// Gets the logged in user information from the Aladdin Connect Api
  /// - Parameter completion: The completion handler to call after success
  public func getUser(completion: @escaping (Result<GetUserResponse, Error>) -> Void) {
    logger?.info("Attempting to get user information")
    
    if let session = SessionManager[.authorized] {
      session.getJSON(Constants.URL_USER) { json in
          
        // Capture the session object, so it doesn't get deallocated
        // not sure why this is necessary, but if it's not captured
        // then deinit is called on it
        let _ = session
      
          switch json.result {
          case let .success(response):
            let getUserResponse = GetUserResponse.init(fromJson: JSON(response))
            if let session = SessionManager[.authorized],
               let interceptor = session.interceptor as? Interceptor,
               let authInterceptor = interceptor.adapters[0] as? AuthenticationInterceptor<AuthenticatedAuthenticator>,
               let credentials = authInterceptor.credential {
              credentials.userEmail = getUserResponse.email
              credentials.id = getUserResponse.id
              self.onSaveCredentialsInternal(credentials);
            }
            
            self.logger?.info("Request to get user information succeeded.")
            completion(.success(getUserResponse))
            
          case let .failure(error):
            self.logger?.error("Request to get user information failed.  The user will be logged out.", metadata: ["Error": "\(error)"])
            //self.logout()
            completion(.failure(error))
          }
        }
    }
  }
}


