// swift-tools-version:5.9
import PackageDescription

// IMPORTANT:
// - Update `url` and `checksum` when releasing a new version.
// - The referenced ZIP must contain `VonageWebRTC.xcframework` at the archive root.

let package = Package(
    name: "VonageWebRTC",
    platforms: [
        .iOS(.v15),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "VonageWebRTC",
            targets: ["VonageWebRTC"]
        ),
        .library(
            name: "VonageWebRTC_Binary",
            targets: ["VonageWebRTC_Binary"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "VonageWebRTC_Binary",
            url: "https://d3opqjmqzxf057.cloudfront.net/vonage-webrtc/pod/vonagewebrtc/release/121.0.0-dev.71/VonageWebRTC-121.0.0-dev.71.zip",
            checksum: "57246ea43d178e3436ae2b2fb70479e60c77822353b10928cf80038714374b82"
        ),
        .target(
            name: "VonageWebRTC",
            dependencies: [
                .target(name: "VonageWebRTC_Binary")
            ],
            path: "Sources/VonageWebRTC",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("GLKit"),
                .linkedFramework("VideoToolbox"),
                .linkedFramework("CoreAudio"),
                .linkedFramework("Network"),
                .linkedFramework("MetalKit"),
                .linkedLibrary("c++")
            ]
        )
    ]
)
