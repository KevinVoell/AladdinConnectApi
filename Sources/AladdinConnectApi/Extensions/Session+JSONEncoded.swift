//
//  File.swift
//  
//
//  Created by Kevin Voell on 5/30/21.
//

import Alamofire
import Foundation

extension Session {
  
  /// Posts a JSON string to the specified endpoint
  /// - Parameters:
  ///   - convertible: The URL to post to
  ///   - body: The JSON body to post
  ///   - headers: Additional headers for the request
  ///   - interceptor: Interceptor to use for the request
  ///   - requestModifier: Modifier to use for the request
  ///   - completionHandler: The handler to call once the call is complete
  func postJSON(_ convertible: URLConvertible,
                body: Serializable? = nil,
                headers: HTTPHeaders? = nil,
                interceptor: RequestInterceptor? = nil,
                requestModifier: RequestModifier? = nil,
                completionHandler: @escaping (AFDataResponse<Any>) -> Void) {

    self.request(convertible,
                        method: .post,
                        parameters: body?.toDictionary(),
                        encoding: JSONEncoding.default,
                        headers: headers,
                        interceptor: interceptor,
                        requestModifier: requestModifier)
      .validate(statusCode: 200 ..< 299)
      .responseJSON() { json in
        completionHandler(json)
      }
  }
  
  /// Puts a JSON string to the specified endpoint
  /// - Parameters:
  ///   - convertible: The URL to post to
  ///   - body: The JSON body to post
  ///   - headers: Additional headers for the request
  ///   - interceptor: Interceptor to use for the request
  ///   - requestModifier: Modifier to use for the request
  ///   - completionHandler: The handler to call once the call is complete
  func putJSON(_ convertible: URLConvertible,
                body: Serializable? = nil,
                headers: HTTPHeaders? = nil,
                interceptor: RequestInterceptor? = nil,
                requestModifier: RequestModifier? = nil,
                completionHandler: @escaping (AFDataResponse<Any>) -> Void) {

    self.request(convertible,
                        method: .put,
                        parameters: body?.toDictionary(),
                        encoding: JSONEncoding.default,
                        headers: headers,
                        interceptor: interceptor,
                        requestModifier: requestModifier)
      .validate(statusCode: 200 ..< 299)
      .responseJSON() { json in
        completionHandler(json)
      }
  }
  
  /// Gets a JSON string from the specified endpoint
  /// - Parameters:
  ///   - convertible: THe URL to post to
  ///   - body: The JSON body to post
  ///   - headers: Additional headers for the request
  ///   - interceptor: Interceptor to use for the request
  ///   - requestModifier: Modifier to use for the request
  ///   - completionHandler: The handler to call once the call is complete
  func getJSON(_ convertible: URLConvertible,
               headers: HTTPHeaders? = nil,
               interceptor: RequestInterceptor? = nil,
               requestModifier: RequestModifier? = nil,
               completionHandler: @escaping (AFDataResponse<Any>) -> Void) {

    self.request(convertible,
                        method: .get,
                        encoding: URLEncoding.default,
                        headers: headers,
                        interceptor: interceptor,
                        requestModifier: requestModifier)
      .validate(statusCode: 200 ..< 299)
      .responseJSON() { json in
        completionHandler(json)
      }
  }
}
