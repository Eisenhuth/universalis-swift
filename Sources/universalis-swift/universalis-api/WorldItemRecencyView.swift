import Foundation

public struct WorldItemRecencyView: Codable, Identifiable {
    public let itemID: Int
    public let lastUploadTime: Int
    public let worldID: Int
    public let worldName: String?
}

public extension WorldItemRecencyView {
    var id: Int { itemID }
}
