// VonageWebRTC.swift
//
// This target is a lightweight wrapper around the prebuilt `VonageWebRTC` XCFramework.
//
// Why this exists:
// - SwiftPM `binaryTarget` can't declare `linkerSettings`.
// - CocoaPods previously injected required system framework link flags (e.g. AVFoundation).
// - This wrapper target depends on the binary and adds the necessary link settings,
//   so consumers get the same behavior as with CocoaPods.
//
// NOTE: This file intentionally contains no public API.

import Foundation
