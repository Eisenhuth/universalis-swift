// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "universalis-swift",
    platforms: [.iOS(.v15), .macOS(.v12), .visionOS(.v1)],
    products: [
        .library(
            name: "universalis-swift",
            targets: ["universalis-swift"]),
    ],
    targets: [
        .target(
            name: "universalis-swift"
        )
    ]
)
