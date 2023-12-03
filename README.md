# universalis-swift
a simple swift client to easily work with the universalis.app api

# Installation
## Swift Package Manager

1. Xcode -> File -> Add Package Dependency
2. paste this repository url:`https://github.com/Eisenhuth/universalis-swift.git`
3. Add Package

## Swift Package
add this dependency to your `Package.swift` file
```swift
.package(url: "https://github.com/Eisenhuth/universalis-swift", branch: "master")
```

# Usage
```swift
import Foundation
import universalis_swift

//create the client
let universalis = UniversalisClient()

//that's it, just call any of the instance methods from the client
let dataCenters = await universalis.getDataCenters()
let worlds = await universalis.getWorlds()
let taxRates = await universalis.getTaxRates(world: "Phoenix")

let single = await universalis.getCurrentData(worldDcRegion: "Europe", itemId: 39727)
let multi = await universalis.getCurrentData(worldDcRegion: "Europe", itemIds: [2, 3, 4, 5])

let listings = 50
let queryItems = [
    URLQueryItem(name: "listings", value: "\(listings)"),
    URLQueryItem(name: "hq", value: "true")
]
let singleWithQueries = await universalis.getCurrentData(
    worldDcRegion: "Europe",
    itemId: 39727,
    queryItems: queryItems
)

let multiWithQueries = await universalis.getCurrentData(
    worldDcRegion: "Europe",
    itemIds: [2, 3, 4, 5],
    queryItems: queryItems
)
```
