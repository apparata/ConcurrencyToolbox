// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ConcurrencyToolbox",
    platforms: [
        // Relevant platforms.
        .iOS(.v13), .macOS(.v10_15), .tvOS(.v13)
    ],
    products: [
        .library(name: "ConcurrencyToolbox", targets: ["ConcurrencyToolbox"])
    ],
    dependencies: [
        // It's a good thing to keep things relatively
        // independent, but add any dependencies here.
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
