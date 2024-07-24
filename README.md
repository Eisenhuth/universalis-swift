# universalis-swift
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEisenhuth%2Funiversalis-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Eisenhuth/universalis-swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEisenhuth%2Funiversalis-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Eisenhuth/universalis-swift)
[![](https://img.shields.io/badge/DocC-documentation-orange)](https://swiftpackageindex.com/Eisenhuth/universalis-swift/master/documentation/universalis_swift)

a simple swift client to easily work with the universalis.app api

# Installation
## Swift Package Manager

1. Xcode -> File -> Add Package Dependency
2. paste this repository url: `https://github.com/Eisenhuth/universalis-swift.git`
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

let listings = 5
let monthInSeconds = 86400 * 30
let itemIds = [2, 3, 4, 5]
let worldDcRegion = "Europe"

let single = await universalis.getCurrentData(worldDcRegion: worldDcRegion, itemId: 5).result
print("average price: \(single?.averagePrice.rounded() ?? 0) gil")

let multi = await universalis.getCurrentData(worldDcRegion: worldDcRegion, itemIds: itemIds).result
multi?.items?.values.forEach({
    print("\($0.itemID) - listings: \($0.listingsCount)")
})
```


want to use your own queries? use URLQueryItems!
```swift
let queryItems = [
    URLQueryItem(name: "listings", value: "\(listings)"),
    URLQueryItem(name: "entriesWithin", value: "\(monthInSeconds)")
]
let singleWithQueries = await universalis.getCurrentData(
    worldDcRegion: worldDcRegion,
    itemId: 5,
    queryItems: queryItems
).result

let multiWithQueries = await universalis.getCurrentData(
    worldDcRegion: worldDcRegion,
    itemIds: itemIds,
    queryItems: queryItems
).result

singleWithQueries?.listings?.forEach({ listing in
    print("\(listing.pricePerUnit) - \(listing.quantity) - \(listing.retainerCityName) - \(listing.worldName ?? "")")
})

multiWithQueries?.items?.first?.value.listings?.forEach({ listing in
    print("\(listing.pricePerUnit) - \(listing.quantity) - \(listing.retainerCityName) - \(listing.worldName ?? "")")
})

```
