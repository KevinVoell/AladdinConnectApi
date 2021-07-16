//
//  ApiTests.swift
//  
//
//  Created by Kevin Voell on 5/21/21.
//

import XCTest
import Mocker
@testable import AladdinConnectApi
import Logging

final class ApiTests: XCTestCase {
  func testLoggerSet() {
    // arrange
    let api = ApiMock()
    
    let logger = Logger(label: "Test")
    // act
    api.logger = logger
    
    // assert
    XCTAssertNotNil(api.invokedLogger)
    XCTAssertEqual(api.invokedLogger?.label, "Test")
  }
  
  func testLoggerGet() {
    // arrange
    let api = ApiMock()
    
    let expectedLogger = Logger(label: "Test")
    api.stubbedLogger = expectedLogger
    
    // act
    let logger = api.logger
    
    // assert
    XCTAssertNotNil(logger)
    XCTAssertEqual(logger?.label, "Test")
  }
}
