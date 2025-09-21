// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Generated file. Do not edit.
//

import PackageDescription

let package = Package(
    name: "FlutterGeneratedPluginSwiftPackage",
    platforms: [
        .macOS("10.14")
    ],
    products: [
        .library(name: "FlutterGeneratedPluginSwiftPackage", type: .static, targets: ["FlutterGeneratedPluginSwiftPackage"])
    ],
    dependencies: [
        .package(name: "device_info_plus", path: "/Users/kylerdavis/.pub-cache/hosted/pub.dev/device_info_plus-12.1.0/macos/device_info_plus"),
        .package(name: "firebase_app_check", path: "/Users/kylerdavis/.pub-cache/hosted/pub.dev/firebase_app_check-0.4.0+1/macos/firebase_app_check"),
        .package(name: "firebase_auth", path: "/Users/kylerdavis/.pub-cache/hosted/pub.dev/firebase_auth-6.0.2/macos/firebase_auth"),
        .package(name: "firebase_core", path: "/Users/kylerdavis/.pub-cache/hosted/pub.dev/firebase_core-4.1.0/macos/firebase_core"),
        .package(name: "shared_preferences_foundation", path: "/Users/kylerdavis/.pub-cache/hosted/pub.dev/shared_preferences_foundation-2.5.4/darwin/shared_preferences_foundation")
    ],
    targets: [
        .target(
            name: "FlutterGeneratedPluginSwiftPackage",
            dependencies: [
                .product(name: "device-info-plus", package: "device_info_plus"),
                .product(name: "firebase-app-check", package: "firebase_app_check"),
                .product(name: "firebase-auth", package: "firebase_auth"),
                .product(name: "firebase-core", package: "firebase_core"),
                .product(name: "shared-preferences-foundation", package: "shared_preferences_foundation")
            ]
        )
    ]
)
