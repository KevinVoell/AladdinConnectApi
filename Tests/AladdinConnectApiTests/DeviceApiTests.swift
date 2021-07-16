//
//  File.swift
//  
//
//  Created by Kevin Voell on 6/9/21.
//

import Foundation
import Alamofire
import Mocker
@testable import AladdinConnectApi
import Logging
import XCTest

final class DeviceApiTests : XCTestCase {
  func testSetSatus() {
    let expectation = expectation(description: "GetUser runs and calls completion handler successfully")

    // arrange
    let configuration = Configuration()
    
    //user.forwardToOriginalGetUser = true
    
    UserTestData.setupAuthorizedSession()

    if let baseURL = URL(string: Constants.ENDPOINT_ADDRESS) {
      let jsonURL = baseURL.appendingPathComponent(Constants.PATH_DEVICES)
        .appendingPathComponent("\(UserTestData.deviceId)")
        .appendingPathComponent("door")
        .appendingPathComponent("\(UserTestData.doorIndex1)")
        .appendingPathComponent("command")
    
      let mock = Mock(url: URL(string: Constants.URL_USER)!,
                      dataType: .json,
                      statusCode: 200,
                      data: [
                        .get: try! JSONSerialization.data(withJSONObject: UserTestData.getUserResponse, options: .prettyPrinted)
                      ])

      mock.register()
//    // act
//      configuration.device.setStatus(UserTestData.deviceId, command: .open, completion: { result in
//        // assert
//        XCTAssertNotNil(response)
//        
//        switch response {
//        case let .success(getUserResponse):
//          XCTAssertEqual(getUserResponse.email, UserTestData.email)
//          XCTAssertEqual(getUserResponse.id, UserTestData.id)
//        case .failure(_):
//          XCTFail("Request failed")
//        }
//
//        XCTAssertTrue(user.invokedGetUser)
//        expectation.fulfill()
//      })
    }
    
    waitForExpectations(timeout: 5) { error in
      if let error = error {
        XCTFail("waitForExpectationsWithTimeout errored: \(error)")
      }
    }
  }
}
