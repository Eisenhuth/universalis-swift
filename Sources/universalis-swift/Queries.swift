import Foundation

public enum CurrentQuery {
    case hq(Bool)
    case statsWithin(Int)       ///milliseconds
    case entriesWithin(Int)     ///seconds
    case entries(Int)           ///recent history, default 5
    
    var queryItem: URLQueryItem {
        switch self {
            
        case .hq(let value):                return URLQueryItem(name: "hq", value: "\(value)")
        case .statsWithin(let value):       return URLQueryItem(name: "statsWithin", value: "\(value)")
        case .entriesWithin(let value):     return URLQueryItem(name: "entriesWithin", value: "\(value)")
        case .entries(let value):           return URLQueryItem(name: "entries", value: "\(value)")
            
        }
    }
    
    static func hq(_ value: Bool) ->            URLQueryItem { return CurrentQuery.hq(value).queryItem }
    static func statsWithin(_ value: Int) ->    URLQueryItem { return CurrentQuery.statsWithin(value).queryItem }
    static func entriesWithin(_ value: Int) ->  URLQueryItem { return CurrentQuery.entriesWithin(value).queryItem }
    static func entries(_ value: Int) ->        URLQueryItem { return CurrentQuery.entries(value).queryItem }
}
    
public enum HistoryQuery {
    
    case entriesToReturn(Int)   ///default 1800, max 9999
    case statsWithin(Int)       ///milliseconds, default 7 days //WIP
    case entriesWithin(Int)     ///seconds, default 7 days
    case entriesUntil(Int)      ///unix timestamp
    case entriesUntilDate(Date)
    case minSalePrice(Int)
    case maxSalePrice(Int)
    
    var queryItem: URLQueryItem {
        switch self {
            
        case .entriesToReturn(let value):   return URLQueryItem(name: "entriesToReturn", value: "\(value)")
        case .statsWithin(let value):       return URLQueryItem(name: "statsWithin", value: "\(value)")
        case .entriesWithin(let value):     return URLQueryItem(name: "entriesWithin", value: "\(value)")
        case .entriesUntil(let value):      return URLQueryItem(name: "entriesUntil", value: "\(value)")
        case .entriesUntilDate(let value):  return URLQueryItem(name: "entriesUntil", value: "\(value.timeIntervalSince1970)")
        case .minSalePrice(let value):      return URLQueryItem(name: "minSalePrice", value: "\(value)")
        case .maxSalePrice(let value):      return URLQueryItem(name: "maxSalePrice", value: "\(value)")
            
        }
    }
    
    static func entriesToReturn(_ value: Int) -> URLQueryItem { return HistoryQuery.entriesToReturn(value).queryItem }
    static func statsWithin(_ value: Int) ->     URLQueryItem { return HistoryQuery.statsWithin(value).queryItem }
    static func entriesWithin(_ value: Int) ->   URLQueryItem { return HistoryQuery.entriesWithin(value).queryItem }
    static func entriesUntil(_ value: Int) ->    URLQueryItem { return HistoryQuery.entriesUntil(value).queryItem }
    static func minSalePrice(_ value: Int) ->    URLQueryItem { return HistoryQuery.minSalePrice(value).queryItem }
    static func maxSalePrice(_ value: Int) ->    URLQueryItem { return HistoryQuery.maxSalePrice(value).queryItem }
    
}

    
