import PackageDescription

let package = Package(
    name: "jeopardy",
    dependencies: [
        .Package(url: "https://github.com/OpenKitten/MongoKitten.git", majorVersion: 2),
        .Package(url: "https://github.com/onevcat/Rainbow", majorVersion: 2)
    ]
)
