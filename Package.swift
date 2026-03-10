// swift-tools-version:5.9
import PackageDescription

// IMPORTANT:
// - Update `url` and `checksum` when releasing a new version.
// - The referenced ZIP must contain `VonageWebRTC.xcframework` at the archive root.

let package = Package(
    name: "Vonage-WebRTC",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "VonageWebRTCWrapper",
            targets: ["VonageWebRTCWrapper"]
        ),
        .library(
            name: "VonageWebRTC_Binary",
            targets: ["VonageWebRTC_Binary"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "VonageWebRTC_Binary",
            url: "https://d3opqjmqzxf057.cloudfront.net/vonage-webrtc/pod/vonagewebrtc/release/84.0.19/VonageWebRTC-XC-84.0.19.zip",
            checksum: "80115d187fbd8abc41b9b1154100140fc16c2080bc4ac4cdb7d51bd1a6b88ef3"
        ),
        .target(
            name: "VonageWebRTCWrapper",
            dependencies: [
                .target(name: "VonageWebRTC_Binary")
            ],
            path: "Sources/VonageWebRTCWrapper",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("GLKit"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("c++")
            ]
        )
    ]
)
