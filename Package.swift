// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "ConcurrencyToolbox",
    platforms: [
        // Relevant platforms.
        .iOS(.v15), .macOS(.v12), .tvOS(.v15), .visionOS(.v1)
    ],
    products: [
        .library(name: "ConcurrencyToolbox", targets: ["ConcurrencyToolbox"])
    ],
    targets: [
        .target(
            name: "ConcurrencyToolbox",
            dependencies: [],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release)),
                .define("SWIFT_PACKAGE")
            ]),
        .testTarget(name: "ConcurrencyToolboxTests", dependencies: ["ConcurrencyToolbox"]),
    ]
)
