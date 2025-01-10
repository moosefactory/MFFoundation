// swift-tools-version: 5.9

//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software
//  ------------------------------------------

import PackageDescription

let package = Package(
    name: "MFFoundation",
    platforms: [
        .macOS(.v11),
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MFFoundation",
            targets: ["MFFoundation"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MFFoundation"),
        .testTarget(
            name: "MFFoundationTests",
            dependencies: ["MFFoundation"]
        ),
    ]
)
