//
//  File.swift
//  
//
//  Created by Kevin Voell on 5/21/21.
//

import Foundation
import Logging
@testable import AladdinConnectApi

class ApiMock: Api {

  var invokedLoggerSetter = false
  var invokedLoggerSetterCount = 0
  var invokedLogger: Logger?
  var invokedLoggerList = [Logger?]()
  var invokedLoggerGetter = false
  var invokedLoggerGetterCount = 0
  var stubbedLogger: Logger!

  var logger: Logger? {
    set {
      invokedLoggerSetter = true
      invokedLoggerSetterCount += 1
      invokedLogger = newValue
      invokedLoggerList.append(newValue)
    }
    get {
      invokedLoggerGetter = true
      invokedLoggerGetterCount += 1
      return stubbedLogger
    }
  }
}
