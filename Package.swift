// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConnectWise_SwiftSdk",
    platforms: [.macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ConnectWise_SwiftSdk",
            targets: ["ConnectWise_SwiftSdk"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.0"))
//        .package(url: "https://github.com/vapor/jwt-kit.git", from: "5.0.0"),
//        .package(url: "https://github.com/daltoniam/Starscream.git", from: "4.0.6"),
//        .package(url: "https://github.com/Flight-School/AnyCodable", from: "0.6.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ConnectWise_SwiftSdk",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire")
            ]
//            dependencies: [
//                .product(name: "JWTKit", package: "jwt-kit"),
//                .product(name: "Starscream", package: "Starscream"),
//                .product(name: "AnyCodable", package: "AnyCodable"),
//            ]
        ),
        .testTarget(
            name: "ConnectWise_SwiftSdkTests",
            dependencies: ["ConnectWise_SwiftSdk"]
        ),
    ]
)

//let package = Package(
//    name: "ConnectWise_SwiftSdk",
//    platforms: [.macOS(.v13)],
//    products: [
//        // Products define the executables and libraries a package produces, making them visible to other packages.
//        .library(
//            name: "ConnectWise_SwiftSdk",
//            targets: ["ConnectWise_SwiftSdk"]),
//    ],
//    dependencies: [
////        .package(url: "https://github.com/Flight-School/AnyCodable", from: "0.6.0"),
//    ],
//    targets: [
//        // Targets are the basic building blocks of a package, defining a module or a test suite.
//        // Targets can depend on other targets in this package and products from dependencies.
//        .target(name: "ConnectWise_SwiftSdk")
//        .testTarget(
//            name: "ConnectWise_SwiftSdkTests",
//            dependencies: ["ConnectWise_SwiftSdk"]
//        ),
//    ]
//)
