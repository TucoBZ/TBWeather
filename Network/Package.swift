// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Network",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Network",
            targets: ["Network"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "NetworkInterface"),
        .package(path: "WeatherCore")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Network",
            dependencies: ["NetworkInterface", "WeatherCore"]),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["Network", "NetworkInterface", "WeatherCore"]),
    ]
)
