//swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "UIStylable",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UIStylable",
            targets: ["UIStylable"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UIStylable",
            dependencies: []),
        .testTarget(
            name: "UIStylableTests",
            dependencies: ["UIStylable"])
    ]
)
