//
//  File.swift
//  
//
//  Created by Kevin Voell on 5/21/21.
//

import Foundation
import Logging
@testable import AladdinConnectApi

class ConfigurationMock: Configuration {

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

  var invokedOnSaveConfigurationInternalSetter = false
  var invokedOnSaveConfigurationInternalSetterCount = 0
  var invokedOnSaveConfigurationInternal: ((ConfigurationResponse) -> Void)?
  var invokedOnSaveConfigurationInternalList = [(ConfigurationResponse) -> Void]()
  var invokedOnSaveConfigurationInternalGetter = false
  var invokedOnSaveConfigurationInternalGetterCount = 0
  var stubbedOnSaveConfigurationInternal: ((ConfigurationResponse) -> Void)! = { _ in }
  var forwardToOriginalOnSaveConfigurationInternal = false

  override var onSaveConfigurationInternal: (ConfigurationResponse) -> Void {
    set {
      invokedOnSaveConfigurationInternalSetter = true
      invokedOnSaveConfigurationInternalSetterCount += 1
      invokedOnSaveConfigurationInternal = newValue
      invokedOnSaveConfigurationInternalList.append(newValue)
      if forwardToOriginalOnSaveConfigurationInternal {
        super.onSaveConfigurationInternal = newValue
      }
    }
    get {
      invokedOnSaveConfigurationInternalGetter = true
      invokedOnSaveConfigurationInternalGetterCount += 1
      if forwardToOriginalOnSaveConfigurationInternal {
        return super.onSaveConfigurationInternal
      }
      return stubbedOnSaveConfigurationInternal
    }
  }

  var invokedOnLoadConfigurationInternalSetter = false
  var invokedOnLoadConfigurationInternalSetterCount = 0
  var invokedOnLoadConfigurationInternal: (() -> ConfigurationResponse?)?
  var invokedOnLoadConfigurationInternalList = [() -> ConfigurationResponse?]()
  var invokedOnLoadConfigurationInternalGetter = false
  var invokedOnLoadConfigurationInternalGetterCount = 0
  var stubbedOnLoadConfigurationInternal: (() -> ConfigurationResponse?)! = { return nil }
  var forwardToOriginalOnLoadConfigurationInternal = false

  override var onLoadConfigurationInternal: () -> ConfigurationResponse? {
    set {
      invokedOnLoadConfigurationInternalSetter = true
      invokedOnLoadConfigurationInternalSetterCount += 1
      invokedOnLoadConfigurationInternal = newValue
      invokedOnLoadConfigurationInternalList.append(newValue)
      if forwardToOriginalOnLoadConfigurationInternal {
        super.onLoadConfigurationInternal = newValue
      }
    }
    get {
      invokedOnLoadConfigurationInternalGetter = true
      invokedOnLoadConfigurationInternalGetterCount += 1
      if forwardToOriginalOnLoadConfigurationInternal {
        return super.onLoadConfigurationInternal
      }
      return stubbedOnLoadConfigurationInternal
    }
  }

  var invokedOnConfigurationChangedInternalSetter = false
  var invokedOnConfigurationChangedInternalSetterCount = 0
  var invokedOnConfigurationChangedInternal: ((ConfigurationResponse) -> Void)?
  var invokedOnConfigurationChangedInternalList = [(ConfigurationResponse) -> Void]()
  var invokedOnConfigurationChangedInternalGetter = false
  var invokedOnConfigurationChangedInternalGetterCount = 0
  var stubbedOnConfigurationChangedInternal: ((ConfigurationResponse) -> Void)! = { _ in }
  var forwardToOriginalOnConfigurationChangedInternal = false

  override var onConfigurationChangedInternal: (ConfigurationResponse) -> Void {
    set {
      invokedOnConfigurationChangedInternalSetter = true
      invokedOnConfigurationChangedInternalSetterCount += 1
      invokedOnConfigurationChangedInternal = newValue
      invokedOnConfigurationChangedInternalList.append(newValue)
      if forwardToOriginalOnConfigurationChangedInternal {
        super.onConfigurationChangedInternal = newValue
      }
    }
    get {
      invokedOnConfigurationChangedInternalGetter = true
      invokedOnConfigurationChangedInternalGetterCount += 1
      if forwardToOriginalOnConfigurationChangedInternal {
        return super.onConfigurationChangedInternal
      }
      return stubbedOnConfigurationChangedInternal
    }
  }

  var invokedInviteSetter = false
  var invokedInviteSetterCount = 0
  var invokedInvite: InviteApi?
  var invokedInviteList = [InviteApi]()
  var invokedInviteGetter = false
  var invokedInviteGetterCount = 0
  var stubbedInvite: InviteApi!
  var forwardToOriginalInvite = false

  override var invite: InviteApi {
    set {
      invokedInviteSetter = true
      invokedInviteSetterCount += 1
      invokedInvite = newValue
      invokedInviteList.append(newValue)
      if forwardToOriginalInvite {
        super.invite = newValue
      }
    }
    get {
      invokedInviteGetter = true
      invokedInviteGetterCount += 1
      if forwardToOriginalInvite {
        return super.invite
      }
      return stubbedInvite
    }
  }

  var invokedUserSetter = false
  var invokedUserSetterCount = 0
  var invokedUser: UserApi?
  var invokedUserList = [UserApi]()
  var invokedUserGetter = false
  var invokedUserGetterCount = 0
  var stubbedUser: UserApi!
  var forwardToOriginalUser = false

  override var user: UserApi {
    set {
      invokedUserSetter = true
      invokedUserSetterCount += 1
      invokedUser = newValue
      invokedUserList.append(newValue)
      if forwardToOriginalUser {
        super.user = newValue
      }
    }
    get {
      invokedUserGetter = true
      invokedUserGetterCount += 1
      if forwardToOriginalUser {
        return super.user
      }
      return stubbedUser
    }
  }

  var invokedDeviceSetter = false
  var invokedDeviceSetterCount = 0
  var invokedDevice: DeviceApi?
  var invokedDeviceList = [DeviceApi]()
  var invokedDeviceGetter = false
  var invokedDeviceGetterCount = 0
  var stubbedDevice: DeviceApi!
  var forwardToOriginalDevice = false

  override var device: DeviceApi {
    set {
      invokedDeviceSetter = true
      invokedDeviceSetterCount += 1
      invokedDevice = newValue
      invokedDeviceList.append(newValue)
      if forwardToOriginalDevice {
        super.device = newValue
      }
    }
    get {
      invokedDeviceGetter = true
      invokedDeviceGetterCount += 1
      if forwardToOriginalDevice {
        return super.device
      }
      return stubbedDevice
    }
  }

  var invokedOnLoadConfiguration = false
  var invokedOnLoadConfigurationCount = 0
  var shouldInvokeOnLoadConfigurationCompletion = false
  var forwardToOriginalOnLoadConfiguration = false

  override func onLoadConfiguration(_ completion: @escaping () -> ConfigurationResponse?) {
    invokedOnLoadConfiguration = true
    invokedOnLoadConfigurationCount += 1
    if forwardToOriginalOnLoadConfiguration {
      super.onLoadConfiguration(completion)
      return
    }
    if shouldInvokeOnLoadConfigurationCompletion {
      _ = completion()
    }
  }

  var invokedOnSaveConfiguration = false
  var invokedOnSaveConfigurationCount = 0
  var stubbedOnSaveConfigurationCompletionResult: (ConfigurationResponse, Void)?
  var forwardToOriginalOnSaveConfiguration = false

  override func onSaveConfiguration(_ completion: @escaping (ConfigurationResponse) -> Void) {
    invokedOnSaveConfiguration = true
    invokedOnSaveConfigurationCount += 1
    if forwardToOriginalOnSaveConfiguration {
      super.onSaveConfiguration(completion)
      return
    }
    if let result = stubbedOnSaveConfigurationCompletionResult {
      completion(result.0)
    }
  }

  var invokedOnConfigurationChanged = false
  var invokedOnConfigurationChangedCount = 0
  var stubbedOnConfigurationChangedCompletionResult: (ConfigurationResponse, Void)?
  var forwardToOriginalOnConfigurationChanged = false

  override func onConfigurationChanged(_ completion: @escaping (ConfigurationResponse) -> Void) {
    invokedOnConfigurationChanged = true
    invokedOnConfigurationChangedCount += 1
    if forwardToOriginalOnConfigurationChanged {
      super.onConfigurationChanged(completion)
      return
    }
    if let result = stubbedOnConfigurationChangedCompletionResult {
      completion(result.0)
    }
  }

  var invokedLoadConfiguration = false
  var invokedLoadConfigurationCount = 0
  var stubbedLoadConfigurationCompletionResult: (ConfigurationResponse?, Void)?
  var forwardToOriginalLoadConfiguration = false

  override func loadConfiguration(completion: (ConfigurationResponse?) -> Void) {
    invokedLoadConfiguration = true
    invokedLoadConfigurationCount += 1
    if forwardToOriginalLoadConfiguration {
      super.loadConfiguration(completion: completion)
      return
    }
    if let result = stubbedLoadConfigurationCompletionResult {
      completion(result.0)
    }
  }

  var invokedGetConfiguration = false
  var invokedGetConfigurationCount = 0
  var stubbedGetConfigurationCompletionResult: (Result<ConfigurationResponse, Error>, Void)?
  var forwardToOriginalGetConfiguration = false

  override func getConfiguration(completion: @escaping (Result<ConfigurationResponse, Error>) -> Void) {
    invokedGetConfiguration = true
    invokedGetConfigurationCount += 1
    if forwardToOriginalGetConfiguration {
      super.getConfiguration(completion: completion)
      return
    }
    if let result = stubbedGetConfigurationCompletionResult {
      completion(result.0)
    }
  }
}
