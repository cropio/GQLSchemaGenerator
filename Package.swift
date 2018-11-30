// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GQLSchemaGenerator",
    dependencies: [
        .package(url: "https://github.com/Lumyk/GQLSchema.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "GQLSchemaGenerator",
            dependencies: ["GQLSchemaGeneratorCore"]
        ),
        .target(name: "GQLSchemaGeneratorCore"),
        .testTarget(
            name: "GQLSchemaGeneratorTests",
            dependencies: ["GQLSchemaGeneratorCore", "GQLSchema"]
        ),
    ]
)
