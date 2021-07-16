// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AladdinConnectApi",
    platforms: [
      .macOS(.v10_15), .iOS(.v11), .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AladdinConnectApi",
            targets: ["AladdinConnectApi"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
      .package(url: "https://github.com/Alamofire/Alamofire", from: "5.4.2"),
      .package(url: "https://github.com/apple/swift-log", from: "1.4.2"),
      .package(url: "https://github.com/WeTransfer/Mocker.git", .upToNextMajor(from: "2.3.0")),
      .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", .upToNextMajor(from: "5.0.1")),
      .package(url: "https://github.com/malcommac/SwiftDate", .upToNextMajor(from: "6.3.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AladdinConnectApi",
            dependencies: [
              .product(name: "Alamofire", package: "Alamofire"),
              .product(name: "Logging", package: "swift-log"),
              .product(name: "SwiftyJSON", package: "SwiftyJSON"),
              .product(name: "SwiftDate", package: "SwiftDate")
            ]),
        .testTarget(
            name: "AladdinConnectApiTests",
            dependencies: [
              "AladdinConnectApi",
              //.product(name: "mockingbird", package: "Mockingbird")
              "Mocker",
            ]),
    ]
)
