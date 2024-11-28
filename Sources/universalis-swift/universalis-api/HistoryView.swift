import Foundation

public struct HistoryView: Codable, Identifiable {
    public let itemID: Int
    public let worldID: Int?
    public let lastUploadTime: Int
    public let entries: [MinimizedSaleView]
    public let dcName: String?
    public let regionName: String?
    public let stackSizeHistogram: [Int : Int]?
    public let stackSizeHistogramNQ: [Int : Int]?
    public let stackSizeHistogramHQ: [Int : Int]?
    public let regularSaleVelocity: Float
    public let nqSaleVelocity: Float
    public let hqSaleVelocity: Float
    public let worldName: String?
}

public extension HistoryView {
    var id: Int { itemID }
}
