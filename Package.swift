// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Down",
    platforms: [
        .iOS(.v13),
        .tvOS(.v12),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "Down",
            targets: ["Down"])
    ],
    targets: [
        .target(
            name: "Down",
            dependencies: ["libcmark"],
            path: "Source",
            sources: [
                "Renderers", 
                "Enums & Options", 
                "Extensions", 
                "Down.swift", 
                "Style",
                "Views",
                "AST",
                "AttributeParser"
            ],
            publicHeadersPath: "."
        ),
        .target(
            name: "libcmark",
            path: "libcmark",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .define("CMARK_STATIC_DEFINE")
            ]
        ),
        .testTarget(
            name: "DownTests",
            dependencies: ["Down"],
            path: "Tests",
            resources: [
                .process("Fixtures/TestDownView.bundle")
            ]
        )
    ]
)
