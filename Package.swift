// swift-tools-version:5.9
import PackageDescription

// IMPORTANT:
// - Update `url` and `checksum` when releasing a new version.
// - The referenced ZIP must contain `VonageWebRTC.xcframework` at the archive root.

let package = Package(
    name: "VonageWebRTC",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
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
            url: "https://d3opqjmqzxf057.cloudfront.net/vonage-webrtc/pod/vonagewebrtc/release/99.9.30/VonageWebRTC-99.9.30.zip",
            checksum: "deaf8a7130a09007e4f4f722394173a34d7b07c8e6a8752f04510a10f72eeb39"
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
