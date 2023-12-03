import Foundation

public struct HistoryView: Codable {
    public let itemID: Int
    public let worldID: Int?
    public let lastUploadTime: Int
    public let entries: [MinimizedSaleView]
    public let dcName: String?
    public let regionName: String?
    //TODO: //public let stackSizeHistogram: [String : Int]?
    //TODO: //public let stackSizeHistogramNQ: [String : Int]?
    //TODO: //public let stackSizeHistogramHQ: [String : Int]?
    public let regularSaleVelocity: Float
    public let nqSaleVelocity: Float
    public let hqSaleVelocity: Float
    public let worldName: String?
}
