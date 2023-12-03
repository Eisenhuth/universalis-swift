import Foundation

public struct ListingView: Codable, Identifiable {
    public let lastReviewTime: Int
    public let pricePerUnit: Int
    public let quantity: Int
    public let stainID: Int
    public let worldName: String?
    public let worldID: Int?
    public let creatorName: String?
    public let creatorID: String?
    public let hq: Bool
    public let isCrafted: Bool
    public let listingID: String?
    public let materia: [MateriaView]?
    public let onMannequin: Bool
    public let retainerCity: Int
    public let retainerID: String?
    public let retainerName: String?
    public let sellerID: String?
    public let total: Int
}

public extension ListingView{
    
    var id: Int{ listingID?.hashValue ?? UUID().hashValue }
    
    var retainerCityName: String {
        switch retainerCity {
        case 1:
            return "Limsa Lominsa"
        case 2:
            return "Gridania"
        case 3:
            return "Ul'dah"
        case 4:
            return "Ishgard"
        case 7:
            return "Kugane"
        case 10:
            return "Crystarium"
        case 12:
            return "Old Sharlayan"
        default:
            return ""
        }
    }
}
