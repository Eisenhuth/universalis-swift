public struct CurrentlyShownMultiViewV2: Codable {
    public let itemIDs: [Int]?
    public let items: [Int : CurrentlyShownView]?
    public let worldID: Int?
    public let dcName: String?
    public let regionName: String?
    public let unresolvedItems: [Int]?
    public let worldName: String?    
}
