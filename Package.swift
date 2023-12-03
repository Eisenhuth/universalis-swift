// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "universalis-swift",
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
