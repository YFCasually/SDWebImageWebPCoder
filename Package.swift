// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDWebImageWebPCoder",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(
            name: "SDWebImageWebPCoder",
            targets: ["SDWebImageWebPCoder"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.17.0"),
        .package(url: "https://github.com/SDWebImage/libwebp-Xcode.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "SDWebImageWebPCoder",
            dependencies: [
                .product(name: "SDWebImage", package: "SDWebImage"),
                .product(name: "libwebp", package: "libwebp-Xcode")
            ],
            path: "SDWebImageWebPCoder",
            sources: ["Classes"],
            publicHeadersPath: "Classes",
            cSettings: [
                .headerSearchPath("Private"),
                .define("SD_WEBP", to: "1")
            ]
        )
    ]
)
