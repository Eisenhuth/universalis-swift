import Foundation

public func convertDict(_ inputDict: [String : Int]?) -> [Int : Int]{
    Dictionary(uniqueKeysWithValues: inputDict?.compactMap { key, value in
        Int(key).map { ($0, value) }
    } ?? [])
}
