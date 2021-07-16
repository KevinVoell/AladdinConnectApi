//
//  AuthAuthenticator.swift
//  AladdinConnectApi
//
//  Created by Kevin Voell on 5/16/21.
//

import Alamofire
import Foundation

/// The AuthorizationInterceptor class handles non-authenticated requests to the Aladdin Connect api
class AuthorizationInterceptor: Alamofire.RequestInterceptor {
  public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
    var request = urlRequest
    request.headers.add(name: "X-API-Key", value: Constants.X_API_KEY)
    request.headers.add(name: "User-Agent", value: Constants.USER_AGENT)
    request.headers.add(name: "Content-Type", value: "application/x-www-form-urlencoded")

    completion(.success(request))
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
