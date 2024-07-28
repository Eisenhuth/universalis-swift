public struct AggregatedMarketBoardData: Codable {
    public let results: [AggregatedMarketBoardDataResult]?
    public let failedItems: [Int]?
}

public struct AggregatedMarketBoardDataResult: Codable {
    public let itemId: Int
    public let nq: AggregatedResult?
    public let hq: AggregatedResult?
    public let worldUploadTimes: [WorldUploadTime]?
}

public struct AggregatedResult: Codable {
    public let minListing: MinListing?
    public let medianListing: MedianListing?
    public let recentPurchase: RecentPurchase?
    public let averageSalePrice: AverageSalePrice?
    public let dailySaleVelocity: DailySaleVelocity?
}

public struct AverageSalePrice: Codable {
    public let world: AverageSalePriceEntry?
    public let dc: AverageSalePriceEntry?
    public let region: AverageSalePriceEntry?
    
    public struct AverageSalePriceEntry: Codable {
        let price: Int
    }
}

public struct DailySaleVelocity: Codable {
    public let world: DailySaleVelocityEntry?
    public let dc: DailySaleVelocityEntry?
    public let region: DailySaleVelocityEntry?
    
    public struct DailySaleVelocityEntry: Codable {
        public let quantity: Double
    }
}

public struct MedianListing: Codable {
    public let world: MedianListingEntry?
    public let dc: MedianListingEntry?
    public let region: MedianListingEntry?
    
    public struct MedianListingEntry: Codable {
        public let price: Int
    }
}

public struct MinListing: Codable {
    public let world: MinListingEntry?
    public let dc: MinListingEntry?
    public let region: MinListingEntry?
    
    public struct MinListingEntry: Codable {
        public let price: Int
        public let worldId: Int?
    }
}

public struct RecentPurchase: Codable {
    public let world: RecentPurchaseEntry?
    public let dc: RecentPurchaseEntry?
    public let region: RecentPurchaseEntry?
    
    public struct RecentPurchaseEntry: Codable {
        public let price: Int
        public let timestamp: Int
        public let worldId: Int?
    }
}

public struct WorldUploadTime: Codable {
    public let worldId: Int
    public let timestamp: Int
}
