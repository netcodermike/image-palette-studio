// swift-tools-version: 5.9
import PackageDescription
let package = Package(name: "LocalApp", platforms: [.macOS(.v13)], products: [.executable(name: "LocalApp", targets: ["LocalApp"])], targets: [.executableTarget(name: "LocalApp")])
