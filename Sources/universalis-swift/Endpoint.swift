import Foundation

public struct Endpoint {
    let path: String
    var queryItems: [URLQueryItem]?
}

public extension Endpoint {
    
    static func dataCenters() -> Endpoint {
        return Endpoint(path: "/api/v2/data-centers")
    }
    
    static func worlds() -> Endpoint {
        return Endpoint(path: "/api/v2/worlds")
    }
    
    static func leastRecentlyUpdated(world: String, queryItems: [URLQueryItem]?) -> Endpoint {
        return Endpoint(path: "/api/v2/extra/stats/least-recently-updated", queryItems: queryItems)
    }
    
    static func currentData(worldDcRegion: String, itemId: Int, queryItems: [URLQueryItem]?) -> Endpoint{
        return Endpoint(path: "/api/v2/\(worldDcRegion)/\(itemId)", queryItems: queryItems)
    }
    
    static func currentData(worldDcRegion: String, itemIds: [Int], queryItems: [URLQueryItem]?) -> Endpoint{
        return Endpoint(
            path: "/api/v2/\(worldDcRegion)/\(itemIds.map { String($0) }.joined(separator: ","))",
            queryItems: queryItems
        )
    }
    
    static func aggregatedData(worldDcRegion: String, itemIds: [Int]) -> Endpoint {
        return Endpoint(path: "/api/v2/aggregated/\(worldDcRegion)/\(itemIds.map { String($0) }.joined(separator: ","))")
    }
    
    static func history(worldDcRegion: String, itemId: Int, queryItems: [URLQueryItem]?) -> Endpoint {
        return Endpoint(path: "/api/v2/history/\(worldDcRegion)/\(itemId)", queryItems: queryItems)
    }
    
    static func history(worldDcRegion: String, itemIds: [Int], queryItems: [URLQueryItem]?) -> Endpoint {
        return Endpoint(
            path: "/api/v2/history/\(worldDcRegion)/\(itemIds.map { String($0) }.joined(separator: ","))",
            queryItems: queryItems
        )
    }
    
    static func taxRates(world: String) -> Endpoint {
        return Endpoint(path: "/api/v2/tax-rates", queryItems: [URLQueryItem(name: "world", value: world)])
    }
    
    static func marketableItems() -> Endpoint {
        return Endpoint(path: "/api/v2/marketable")
    }
    
    static func mostRecentlyUpdated(world: String, queryItems: [URLQueryItem]?) -> Endpoint {
        return Endpoint(path: "/api/v2/extra/stats/most-recently-updated", queryItems: queryItems)
    }
    
    static func recentlyUpdated() -> Endpoint {
        return Endpoint(path: "/api/v2/extra/stats/recently-updated")
    }
    
    static func uploadsByApplication() -> Endpoint {
        return Endpoint(path: "/api/v2/extra/stats/uploader-upload-counts")
    }
    
    static func uploadsByWorld() -> Endpoint {
        return Endpoint(path: "/api/v2/extra/stats/world-upload-counts")
    }
    
    static func uploadsPerDay() -> Endpoint {
        return Endpoint(path: "/api/v2/extra/stats/upload-history")
    }
    
}

public extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "universalis.app"
        components.path = path
        if queryItems != nil {
            components.queryItems = queryItems
        }
        
        return components.url
    }
}
