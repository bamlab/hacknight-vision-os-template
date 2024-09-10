import ProjectDescription

let name = "YOURAPP"

let project = Project(
    name: name,
    packages: [
        .local(path: "Packages/SimpleBall"),
        .remote(url: "https://github.com/XanderXu/RealityMoreShape", requirement: .exact("0.9.3")),
    ],
    targets: [
        .target(
            name: name,
            destinations: .visionOS,
            product: .app,
            bundleId: "com.theodo.apps.\(name)",
            infoPlist: .default,
            sources: ["App/Sources/**"],
            resources: ["App/Resources/**"],
            dependencies: [
                .package(product: "SimpleBall"),
                .package(product: "RealityMoreShape"),
            ]
        ),
    ]
)
