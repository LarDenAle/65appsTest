// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Task3",
    products: [
        .library(
            name: "Task3",
            targets: ["Task3"]),
    ],
    dependencies: [
        // подключаем зависимость-пакет Alamofire, указываем ссылку на GitHub
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0") // Проблема - версия 5.4.1 не подходит т.к. ошибка:
        //The package product 'Alamofire' requires minimum platform version 10.12 for the macOS platform, but this target supports 10.10
    ],
    targets: [
        .target(
            name: "Task3",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "Task3Tests",
            dependencies: ["Task3"]),
    ]
)
