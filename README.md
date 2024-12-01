# universalis-swift
a simple swift client to easily work with the universalis.app api

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEisenhuth%2Funiversalis-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Eisenhuth/universalis-swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEisenhuth%2Funiversalis-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Eisenhuth/universalis-swift)
[![](https://img.shields.io/badge/DocC-documentation-orange)](https://swiftpackageindex.com/Eisenhuth/universalis-swift/master/documentation/universalis_swift)


> [!TIP]
> This package closely matches the official API documentation which you can find here: https://docs.universalis.app

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

### Initialization

```swift
import Foundation
import universalis_swift

let universalis = UniversalisClient()
```


### Current Listings
you can request single items or multiple items at the same time
```swift
let single = await universalis.getCurrentData(worldDcRegion: "Europe", itemId: 5)
print("average price: \(single.result?.averagePrice.rounded() ?? 0) gil")

let multi = await universalis.getCurrentData(worldDcRegion: "Europe", itemIds: [2, 3, 4, 5])
multi.result?.items?.values.forEach({
    print("ItemId: \($0.itemID) - listings: \($0.listingsCount)")
})
```

### Sales History
works just like current data
```swift
let historySingle = await universalis.getHistory(worldDcRegion: "Europe", itemId: 5)
let historyMulti = await universalis.getHistory(worldDcRegion: "Europe", itemIds: [2, 3, 4, 5])
```

### Aggregated Data

```swift
let aggregated = await universalis.getAggregatedData(worldDcRegion: "Europe", itemIds: [2, 3, 4, 5])
aggregated.result?.results?.forEach({
    if let cheapestWorld = $0.nq?.minListing?.region {
        let worldName = worlds.result?.first { $0.id == cheapestWorld.worldId }?.name ?? "no name"
        print("ItemId: \($0.itemId) - cheapest world: \(worldName) - \(cheapestWorld.price) gil")
    }
})
```
> [!WARNING]
> Be aware that almost everything in the returned Aggregated Data is optional.

### Queries: Two Approaches
you can use the built-in queries or provide your own `[URLQueryItems]`, they function the same
```swift
let monthInSeconds = 86400 * 30

let example1 = await universalis.getCurrentData(worldDcRegion: "Europe", itemId: 5, queries: [
    .listings(10),
    .entriesWithin(monthInSeconds)
])
let example2 = await universalis.getCurrentData(worldDcRegion: "Europe", itemId: 5, queryItems: [
    URLQueryItem(name: "listings", value: "\(10)"),
    URLQueryItem(name: "entriesWithin", value: "\(monthInSeconds)")
])

example1.result?.listings?.forEach({ listing in
    print("\(listing.pricePerUnit) - \(listing.quantity) - \(listing.retainerCityName) - \(listing.worldName ?? "")")
})

print("same: \(example1.result?.averagePrice == example2.result?.averagePrice)")
print(example1.result?.averagePrice.rounded() ?? 0)
print(example2.result?.averagePrice.rounded() ?? 0)
```

### Extras
```swift
let marketableItems = await universalis.getMarketableItems()
let dataCenters = await universalis.getDataCenters()
let worlds = await universalis.getWorlds()
let taxRates = await universalis.getTaxRates(world: "Phoenix")

let uploadsByWorld = await universalis.getUploadsByWorld()
let uploadsByApplication = await universalis.getUploadsByApplication()
let uploadsPerDay = await universalis.getUploadsPerDay()
```
