import Foundation

public struct HistoryView: Codable, Identifiable {
    public let itemID: Int
    public let worldID: Int?
    public let lastUploadTime: Int
    public let entries: [MinimizedSaleView]
    public let dcName: String?
    public let regionName: String?
    public let stackSizeHistogram: [String : Int]?
    public let stackSizeHistogramNQ: [String : Int]?
    public let stackSizeHistogramHQ: [String : Int]?
    public let regularSaleVelocity: Float
    public let nqSaleVelocity: Float
    public let hqSaleVelocity: Float
    public let worldName: String?
}

public extension HistoryView {
    var id: Int { itemID }
    var stackSizeDict: [Int : Int] { convertDict(stackSizeHistogram) }
    var stackSizeDictHQ: [Int : Int] { convertDict(stackSizeHistogramHQ) }
    var stackSizeDictNQ: [Int : Int] { convertDict(stackSizeHistogramNQ) }
}
