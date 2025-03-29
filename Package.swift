// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DirectorioAPI",
    platforms: [
        .iOS(.v13), .macOS(.v12), .macCatalyst(.v13), .tvOS(.v13), .watchOS(.v8)
    ],
    products: [
        .library(
            name: "DirectorioAPI",
            targets: ["DirectorioAPI"]),
        .executable(name: "DirectorioAPIExec",
                    targets:["DirectorioAPIExec"])
    ],
    targets: [
        .target(
            name: "DirectorioAPI"),
        .executableTarget(name: "DirectorioAPIExec",
                          dependencies: ["DirectorioAPI"]),
        .testTarget(
            name: "DirectorioAPITests",
            dependencies: ["DirectorioAPI"]
        ),
    ]
)
