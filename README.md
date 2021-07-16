# AladdinConnectApi

AladdinConnectApi is an unofficial Swift implmentation of the API for interacting with Aladdin Connect devices.

## Disclaimer

This implementation of the API is not endorsed or licensed by Genie Inc. Use at your own risk. No guarantee of proper function is given. Only you are responsible for any changes to your Aladdin Connect devices caused by using this API.

## Usage

### Imports
```swift
import AladdinConnectApi
```

### Singleton Instance
```swift
var configuration: Configuration = Configuration.shared()
```

### Login
```swift
configuration.user.login(username: "username", password: "password") { loginResponse in
  switch loginResponse {
  case .success(_):
    print("Login successful")
    
  case let .failure(error):
    print("Failed to login, error: \(error)")
  }
}
```

### Get Configuration
```swift
configuration.getConfiguration() { configurationResponse in
  switch configurationResponse {
  case let .success(configuration):
    print("Successfuly received devices")
    
  case let .failure(error):
    print("Failed to get devices, error: \(error)")
  }
}
```

### Get First Device and Door
```swift
if let device = configuration.devices[0],
   let door = device.door[0] {
}
```

### Send Commands

#### Open
```swift
configuration.device.setStatus(door, command: .open) { result in
  switch result {
  case .success(response):

  case let .failure(error):

  }
}
```

#### Close
```swift
configuration.device.setStatus(door, command: .close) { result in
  switch result {
  case .success(response):

  case let .failure(error):

  }
}
```

## Dependencies

AladdinConnectApi uses the following open source components:

[Alamofire](https://github.com/Alamofire/Alamofire) 5.4.2

[Swift-log](https://github.com/apple/swift-log) 1.4.2

[Mocker](https://github.com/WeTransfer/Mocker.git) 2.3.0

[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) 5.0.1

[SwiftDate](https://github.com/malcommac/SwiftDate) 6.3.1


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
