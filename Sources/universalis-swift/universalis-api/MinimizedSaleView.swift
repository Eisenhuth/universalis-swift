import Foundation

public struct MinimizedSaleView: Codable {
    public let hq: Bool
    public let pricePerUnit: Int
    public let quantity: Int
    public let buyerName: String?
    public let onMannequin: Bool?
    public let timestamp: Int
    public let worldName: String?
    public let worldID: Int?
}

public extension MinimizedSaleView {
    var isRecent: Bool {
        let thirtyDaysInSeconds: TimeInterval = 30 * 24 * 60 * 60
        let currentTime = Date().timeIntervalSince1970
        let thirtyDaysAgo = currentTime - thirtyDaysInSeconds
        
        return TimeInterval(timestamp) > thirtyDaysAgo
    }
}
