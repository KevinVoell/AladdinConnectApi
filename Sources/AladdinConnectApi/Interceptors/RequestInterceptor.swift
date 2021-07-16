//
//  NetworkRequestRetrier.swift
//  AladdinConnectApi
//
//  Created by Kevin Voell on 5/7/21.
//

import Alamofire
import Foundation

/// Base interceptor for all calls to the Aladdin Api
class RequestInterceptor: Alamofire.RequestInterceptor {

  public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
    var request = urlRequest
    request.headers.add(name: "X-API-Key", value: Constants.X_API_KEY)
    request.headers.add(name: "User-Agent", value: Constants.USER_AGENT)
    request.headers.add(name: "Content-Type", value: "application/json")

    completion(.success(request))
  }
}
