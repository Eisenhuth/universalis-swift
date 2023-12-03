import Foundation

public struct TaxRatesView: Codable {
    public let LimsaLominsa: Int
    public let Gridania: Int
    public let Uldah: Int
    public let Ishgard: Int
    public let Kugane: Int
    public let Crystarium: Int
    public let OldSharlayan: Int

    private enum CodingKeys : String, CodingKey {
        case LimsaLominsa = "Limsa Lominsa"
        case Gridania
        case Uldah = "Ul'dah"
        case Ishgard
        case Kugane
        case Crystarium
        case OldSharlayan = "Old Sharlayan"
    }
}
