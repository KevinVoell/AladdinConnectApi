//
//  AladinConfiguration.swift
//  AladdinConnectApi
//
//  Created by Kevin Voell on 4/30/21.
//

import Alamofire
import Foundation
import Logging
import SwiftyJSON

/// The AladdinConfiguration class is responsible for communicating with the Aladdin Connect api for devices
public class Configuration: Api {
  public var logger: Logger?
  
  internal var onSaveConfigurationInternal: (ConfigurationResponse) -> Void = { configuration in }
  internal var onLoadConfigurationInternal: () -> ConfigurationResponse? = { return nil }
  internal var onConfigurationChangedInternal: (ConfigurationResponse) -> Void = { configuration in }
  
  public var invite: InviteApi
  public var user: UserApi
  public var device: DeviceApi
  
  private var configuration: ConfigurationResponse?
  
  private static var _shared: Configuration?
  public static func shared(logger: Logger? = nil) -> Configuration {
    if Configuration._shared == nil {
      Configuration._shared = Configuration(logger: logger)
    }
    
    return Configuration._shared!
  }
  
  public init(logger: Logger? = nil) {
    self.logger = logger
    invite = InviteApi(logger: logger)
    user = UserApi(logger: logger)
    device = DeviceApi(logger: logger)
  }
  
  public func onLoadConfiguration(_ completion: @escaping () -> ConfigurationResponse?) {
    self.onLoadConfigurationInternal = completion
  }
  
  public func onSaveConfiguration(_ completion: @escaping (ConfigurationResponse) -> Void) {
    self.onSaveConfigurationInternal = completion
  }
  
  public func onConfigurationChanged(_ completion: @escaping (ConfigurationResponse) -> Void) {
    self.onConfigurationChangedInternal = completion
  }
  
  /// Attempts to load cached data from the Aladdin Connect api
  /// - Parameter model: The model to update
  public func loadConfiguration(completion: (ConfigurationResponse?) -> Void) {
    let configuration = self.onLoadConfigurationInternal()
    
    completion(configuration)
  }
  
  /// Gets the device
  /// - Parameters:
  ///   - model: The model to update after the call is complete
  ///   - completion: The code to call after the device has been retrieved
  public func getConfiguration(completion: @escaping (Result<ConfigurationResponse, Error>) -> Void) {
    if let session = SessionManager[.authorized] {
      session.getJSON("\(Constants.ENDPOINT_ADDRESS)\(Constants.PATH_CONFIGURATION)") { json in
        
        // capture the session object, so it doesn't get deallocated
        // not sure why this is necessary, but if it's not captured
        // then deinit is called on it
        let _ = session
        
        switch json.result {
        case let .success(response):
          let configurationResponse = ConfigurationResponse.init(fromJson: JSON(response))
          self.onSaveConfigurationInternal(configurationResponse)
          completion(.success(configurationResponse))
          
        case let .failure(error):
          self.logger?.error("Request to get devices failed.", metadata: ["Error": "\(error)"])
          
          completion(.failure(error))
        }
      }
    }
  }
}
