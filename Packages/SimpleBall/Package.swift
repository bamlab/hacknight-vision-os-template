// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "SimpleBall",
    products: [
        .library(
            name: "SimpleBall",
            targets: ["SimpleBall"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SimpleBall",
            dependencies: []
        ),
    ]
)
