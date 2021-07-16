//
//  AuthAuthenticator.swift
//  AladdinConnectApi
//
//  Created by Kevin Voell on 5/16/21.
//

import Alamofire
import Foundation
import Logging
import SwiftyJSON

/// The AuthAuthenticator class handles authenticated requests to the Aladdin Connect api
class AuthenticatedAuthenticator: Authenticator {
  private var logger: Logger?
  private var user: UserApi?
  
  init(logger: Logger? = nil, user: UserApi? = nil) {
    self.logger = logger
    self.user = user
  }
  
  func apply(_ credential: AuthCredentials, to urlRequest: inout URLRequest) {
    if let accessToken = credential.accessToken {
      urlRequest.headers.add(.authorization(bearerToken: accessToken))
    }
  }
  
  func refresh(_ credential: AuthCredentials,
               for session: Session,
               completion: @escaping (Result<AuthCredentials, Error>) -> Void) {
    
    self.logger?.trace("Requesting a refresh of the access token")
    
    guard let refreshToken = credential.refreshToken else {
      self.logger?.error("Refresh token not found")
      completion(.failure(AladdinError.unknown("Refresh token not found")))
      return
    }
    
    let request = RefreshTokenRequest(brand: "ALADDIN",
                                        clientId: "1000",
                                        clientSecret: Constants.CLIENT_SECRET,
                                        grantType: "refresh_token",
                                        platform: "IOS",
                                        refreshToken: refreshToken)
    
    if let session = SessionManager[.notAuthorized] {
      session.postURLEncoded("\(Constants.ENDPOINT_ADDRESS)\(Constants.PATH_LOGIN)", body: request) { json in
        
        // Capture the session object, so it doesn't get deallocated
        // not sure why this is necessary, but if it's not captured
        // then deinit is called on it
        let _ = session
        
        switch json.result {
        case .success(let loginResponse):
          let refreshResponse = LoginResponse.init(fromJson: JSON(loginResponse))
          self.logger?.info("Request to refresh access token succeeded.")
          
          refreshResponse.updateExpiresAt()
          
          guard let accessToken = refreshResponse.accessToken,
                let refreshToken = refreshResponse.refreshToken else {
            self.logger?.error("Request to refresh access token failed.")
            completion(.failure(AladdinError.unknown("Request to refresh access token failed.")))
            return
          }
          
          let credentials = AuthCredentials(accessToken: accessToken,
                                            refreshToken: refreshToken,
                                            userEmail: credential.userEmail,
                                            expiration: refreshResponse.expiresAtDate(),
                                            id: credential.id)
          
          self.user?.onSaveCredentialsInternal(credentials)
          
          completion(.success(credentials))
          
        case .failure(let error):
          self.logger?.error("Request to refresh access token failed.", metadata: ["Error": "\(error)"])
          completion(.failure(error))
        }
      }
    }
  }
  
  func didRequest(_ urlRequest: URLRequest,
                  with response: HTTPURLResponse,
                  failDueToAuthenticationError error: Error) -> Bool {
    // If authentication server CANNOT invalidate credentials, return `false`
    return false
    
    // If authentication server CAN invalidate credentials, then inspect the response matching against what the
    // authentication server returns as an authentication failure. This is generally a 401 along with a custom
    // header value.
    // return response.statusCode == 401
  }
  
  func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: AuthCredentials) -> Bool {
    // If authentication server CANNOT invalidate credentials, return `true`
    return true
    
    // If authentication server CAN invalidate credentials, then compare the "Authorization" header value in the
    // `URLRequest` against the Bearer token generated with the access token of the `Credential`.
    // let bearerToken = HTTPHeader.authorization(bearerToken: credential.accessToken).value
    // return urlRequest.headers["Authorization"] == bearerToken
  }
}
