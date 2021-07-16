    import XCTest
    import Alamofire
    import Mocker
    @testable import AladdinConnectApi
    
    final class UserApiTests: XCTestCase {
      func testLogin() {
        
        let expectation = expectation(description: "Login runs and calls completion handler successfully")

        // arrange
        let user = UserApiMock()
        
        user.forwardToOriginalLogin = true
        
        user.stubbedGetUserCompletionResult = (Result<GetUserResponse, Error>.success(UserTestData.aladdinGetUserResponse), ())
        
        UserTestData.setupAuthorizationSession()

        let mock = Mock(url: URL(string: Constants.URL_LOGIN)!,
                        dataType: .json,
                        statusCode: 200,
                        data: [
                          .post: try! JSONSerialization.data(withJSONObject: UserTestData.authorizationResponse, options: .prettyPrinted)
                        ])

        mock.register()

        // act
        user.login(username: UserTestData.email, password: UserTestData.password) { response in
          // assert
          XCTAssertNotNil(response)
          
          switch response {
          case let .success(userResponse):
            XCTAssertEqual(userResponse.email, UserTestData.email)
          case .failure(_):
            XCTFail("Request failed")
          }

          XCTAssertTrue(user.invokedLogin)
          XCTAssertTrue(user.invokedGetUser)
          expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
      }
      
      func testGetUsername() {
        // Arrange
        let user = UserApi()
        
        UserTestData.setupAuthorizedSession()
        
        // act
        // assert
        XCTAssertEqual(user.userEmail, UserTestData.email)
      }
      
      func testGetCurrentLoginStatus()
      {
        // arrange
        let user = UserApi()
        
        // act
        user.currentLoginStatus = .LoggedIn
        
        // assert
        XCTAssertEqual(user.currentLoginStatus, .LoggedIn)
      }
      
      func testCreateAuthorizedSession() {
        // arrange
        let user = UserApi()
        
        // act
        user.createAuthorizedSession(UserTestData.credentials)
        
        // assert
        if let session = SessionManager[.authorized] {
          XCTAssertNotNil(session)
        } else {
          XCTFail("Authorized session not found")
        }
      }
      
      func testGetUser() {
        let expectation = expectation(description: "GetUser runs and calls completion handler successfully")

        // arrange
        let user = UserApiMock()
        
        user.forwardToOriginalGetUser = true
        
        UserTestData.setupAuthorizedSession()

        let mock = Mock(url: URL(string: Constants.URL_USER)!,
                        dataType: .json,
                        statusCode: 200,
                        data: [
                          .get: try! JSONSerialization.data(withJSONObject: UserTestData.getUserResponse, options: .prettyPrinted)
                        ])

        mock.register()

        // act
        user.getUser { response in
          // assert
          XCTAssertNotNil(response)
          
          switch response {
          case let .success(getUserResponse):
            XCTAssertEqual(getUserResponse.email, UserTestData.email)
            XCTAssertEqual(getUserResponse.id, UserTestData.id)
          case .failure(_):
            XCTFail("Request failed")
          }

          XCTAssertTrue(user.invokedGetUser)
          expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
      }
    }
