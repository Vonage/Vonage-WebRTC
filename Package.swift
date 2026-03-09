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
            url: "https://d3opqjmqzxf057.cloudfront.net/vonage-webrtc/pod/vonagewebrtc/release/99.13.0-alpha.50/VonageWebRTC-99.13.0-alpha.50.zip",
            checksum: "49fb0e87664c5f1fac5d22a03d6c2ad460745da1a321b5ea9140cbc7edcf57ff"
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
