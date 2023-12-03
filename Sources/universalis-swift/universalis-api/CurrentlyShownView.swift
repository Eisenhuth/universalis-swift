import Foundation

public struct CurrentlyShownView: Codable, Identifiable {
    public let itemID: Int
    public let worldID: Int?
    public let lastUploadTime: Int
    public let listings: [ListingView]?
    public let recentHistory: [SaleView]?
    public let dcName: String?
    public let regionName: String?
    public let currentAveragePrice: Float
    public let currentAveragePriceNQ: Float
    public let currentAveragePriceHQ: Float
    public let regularSaleVelocity: Float
    public let nqSaleVelocity: Float
    public let hqSaleVelocity: Float
    public let averagePrice: Float
    public let averagePriceNQ: Float
    public let averagePriceHQ: Float
    public let minPrice: Int
    public let minPriceNQ: Int
    public let minPriceHQ: Int
    public let maxPrice: Int
    public let maxPriceNQ: Int
    public let maxPriceHQ: Int
    //TODO: //public var stackSizeHistogram: [String : Int]?
    //TODO: //public var stackSizeHistogramNQ: [String : Int]?
    //TODO: //public var stackSizeHistogramHQ: [String : Int]?
    public let worldName: String?
    //TODO: //var worldUploadTimes: [String : Int]?
    public let listingsCount: Int
    public let recentHistoryCount: Int
    public let unitsForSale: Int
    public let unitsSold: Int
    
}

public extension CurrentlyShownView{
    var id: Int { itemID }
    var cheapestHQWorld: String? { listings?.first { $0.hq == true }?.worldName }
    var cheapestNQWorld: String? { listings?.first { $0.hq == false }?.worldName }
    var minPricePreferringHQ: Int? { minPriceHQ != 0 ? minPriceHQ : minPriceNQ }
    
    //var stackSizeDict: [Int : Int] { convertDict(stackSizeHistogram) }
    //var stackSizeDictHQ: [Int : Int] { convertDict(stackSizeHistogramHQ) }
    //var stackSizeDictNQ: [Int : Int] { convertDict(stackSizeHistogramNQ) }
    
    func convertDict(_ inputDict: [String : Int]?) -> [Int : Int]{
        Dictionary(uniqueKeysWithValues: inputDict?.compactMap { key, value in
            Int(key).map { ($0, value) }
        } ?? [])
    }
    
    var parsedDate: Date{ Date(timeIntervalSince1970: TimeInterval(lastUploadTime)) }
}
