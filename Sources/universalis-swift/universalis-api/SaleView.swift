public struct SaleView: Codable {
    public let hq: Bool
    public let pricePerUnit: Int
    public let quantity: Int
    public let timestamp: Int
    public let onMannequin: Bool?
    public let worldName: String?
    public let worldID: Int?
    public let buyerName: String?
    public let total: Int
}
