// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@available(macOS 12.0, *)
@available(iOS 15.0.0, *)
public class UniversalisClient{
    
    public init(){
        
    }
}

@available(macOS 12.0, *)
@available(iOS 15.0.0, *)
public extension UniversalisClient{
    
    /// get all data centers supported by the API
    /// - Returns: data centers
    func getDataCenters() async -> [DataCenter]?{
        
        let url = Endpoint.dataCenters().url!
        let response:[DataCenter]? = await loadData(url)
        
        return response
    }
    
    /// get the IDs and names of all worlds supported by the API
    /// - Returns: worlds
    func getWorlds() async -> [World]?{
        
        let url = Endpoint.worlds().url!
        let response:[World]? = await loadData(url)
        
        return response
    }
    
    /// get the least-recently updated items on the specified world or data center
    /// - Parameters:
    ///   - world: the world/data center to request data for
    ///   - entries: the number of entries to return (default 50, max 200)
    /// - Returns: the least-recently updated items
    func getLeastRecentlyUpdated(world: String, entries: Int = 50) async -> RecentlyUpdatedItemsView?{
        
        let queryItems = [
            URLQueryItem(name: "world", value: world),
            URLQueryItem(name: "entries", value: entries.description)
        ]
        let url = Endpoint.leastRecentlyUpdated(world: world, queryItems: queryItems).url!
        let response: RecentlyUpdatedItemsView? = await loadData(url)
        
        return response
    }
    
    /// get the data currently shown on the market board for the requested item
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemId: the item to retrieve data for
    ///   - queryItems: the following queries are supported:
    ///   - listings (query): the number of listings to return per item, default is all listings
    ///   - entries (query): the number of recent history entries to return per item, default 5
    ///   - noGst (query): if the result should not have Gil sales tax (GST) factored in. GST is applied to all consumer purchases in-game, and is separate from the retainer city tax that impacts what sellers receive. By default, GST is factored in. Set this parameter to true or 1 to prevent this.
    ///   - hq (query): filter for HQ listings and entries. By default, both HQ and NQ listings will be returned
    ///   - statsWithin (query): the amount of time before now to calculate stats over, in milliseconds, default 7 days
    ///   - entriesWithin (query): the amount of time before now to take entries within, in seconds, default 7 days
    ///   - fields (query): a comma separated list of fields that should be included in the response, if ommitted will return all fields. For example if you're only interested in the listings price per unit you can set this to listings.pricePerUnit
    /// - Returns: current market board data
    func getCurrentData(worldDcRegion: String, itemId: Int, queryItems: [URLQueryItem]? = nil) async -> CurrentlyShownView?{
        
        let url = Endpoint.currentData(worldDcRegion: worldDcRegion, itemId: itemId, queryItems: queryItems).url!
        let response: CurrentlyShownView? = await loadData(url)
        
        return response
    }
    
    /// get the data currently shown on the market board for the requested items
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemIds: the items to retrieve data for
    ///   - queryItems: the following queries are supported:
    ///   - listings (query): the number of listings to return per item, default is all listings
    ///   - entries (query): the number of recent history entries to return per item, default 5
    ///   - noGst (query): if the result should not have Gil sales tax (GST) factored in. GST is applied to all consumer purchases in-game, and is separate from the retainer city tax that impacts what sellers receive. By default, GST is factored in. Set this parameter to true or 1 to prevent this.
    ///   - hq (query): filter for HQ listings and entries. By default, both HQ and NQ listings will be returned
    ///   - statsWithin (query): the amount of time before now to calculate stats over, in milliseconds, default 7 days
    ///   - entriesWithin (query): the amount of time before now to take entries within, in seconds, default 7 days
    ///   - fields (query): a comma separated list of fields that should be included in the response, if ommitted will return all fields. For example if you're only interested in the listings price per unit you can set this to listings.pricePerUnit
    /// - Returns: current market board data
    func getCurrentData(worldDcRegion: String, itemIds: [Int], queryItems: [URLQueryItem]? = nil) async -> CurrentlyShownMultiViewV2?{
        
        let url = Endpoint.currentData(worldDcRegion: worldDcRegion, itemIds: itemIds, queryItems: queryItems).url!
        let response: CurrentlyShownMultiViewV2? = await loadData(url)
        
        return response
    }
    
    /// get the history data for the requested item
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemId: the item to retrieve data for
    ///   - queryItems: the following queries are supported:
    ///   - entriesToReturn (query): the number of entries to return, default 1800, maximum 999999
    ///   - statsWithin (query): the amount of time before now to calculate stats over, in milliseconds, default 7 days
    ///   - entriesWithin (query): the amount of time before now to take entries within, in seconds, default 7 days
    ///   - minSalePrice (query): the inclusive minimum unit sale price of entries to return
    ///   - maxSalePrice (query): the inclusive maximum unit sale price of entries to return
    /// - Returns: market history data
    func getHistory(worldDcRegion: String, itemId: Int, queryItems: [URLQueryItem]? = nil) async -> HistoryView?{
        
        let url = Endpoint.history(worldDcRegion: worldDcRegion, itemId: itemId, queryItems: queryItems).url!
        let response: HistoryView? = await loadData(url)
        
        return response
    }
    
    /// get the history data for the requested items
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemIds: the items to retrieve data for
    ///   - queryItems: the following queries are supported:
    ///   - entriesToReturn (query): the number of entries to return, default 1800, maximum 999999
    ///   - statsWithin (query): the amount of time before now to calculate stats over, in milliseconds, default 7 days
    ///   - entriesWithin (query): the amount of time before now to take entries within, in seconds, default 7 days
    ///   - minSalePrice (query): the inclusive minimum unit sale price of entries to return
    ///   - maxSalePrice (query): the inclusive maximum unit sale price of entries to return
    /// - Returns: market history data
    func getHistory(worldDcRegion: String, itemIds: [Int], queryItems: [URLQueryItem]? = nil) async -> HistoryMultiViewV2?{
        
        let url = Endpoint.history(worldDcRegion: worldDcRegion, itemIds: itemIds, queryItems: queryItems).url!
        let response: HistoryMultiViewV2? = await loadData(url)
        
        return response
    }
    
    
    /// get the current tax rate data for the specified world. This data is provided by the Retainer Vocate in each major city.
    /// - Parameter world: the world to retrieve data for
    /// - Returns: tax rates
    func getTaxRates(world: String) async -> TaxRatesView?{
        
        let url = Endpoint.taxRates(world: world).url!
        let response: TaxRatesView? = await loadData(url)
        
        return response
    }
    
    /// get an array of all marketable items
    /// - Returns: [Int] of all marketable items
    func getMarketableItems() async -> [Int]? {
        
        let url = Endpoint.marketableItems().url!
        let response: [Int]? = await loadData(url)
        
        return response
    }
    
    /// get the most-recently updated items on the specified world or data-center, along with the upload times for each item
    /// - Parameters:
    ///   - world: the world/data center to request data for
    ///   - entries: the number of entries to return (default 50, max 200)
    /// - Returns: the most-recently updated items
    func getMostRecentlyUpdated(world: String, entries: Int = 50) async -> MostRecentlyUpdatedItemsView?{
        
        let queryItems = [
            URLQueryItem(name: "world", value: world),
            URLQueryItem(name: "entries", value: entries.description)
        ]
        let url = Endpoint.mostRecentlyUpdated(world: world, queryItems: queryItems).url!
        let response: MostRecentlyUpdatedItemsView? = await loadData(url)
        
        return response
    }
    
    /// get the total upload count of the uploader applications
    /// - Returns: array with the name and upload count for each application
    func getUploadsByApplication() async -> [SourceUploadCountView]?{
        
        let url = Endpoint.uploadsByApplication().url!
        let response: [SourceUploadCountView]? = await loadData(url)
        
        return response
    }
    
    /// get the total upload count and proportion for each world
    /// - Returns: Dictionary with the server name and the  count/proportion of the uploads
    func getUploadsByWorld() async -> [String : WorldUploadCounts]?{
        
        let url = Endpoint.uploadsByWorld().url!
        let response: [String : WorldUploadCounts]? = await loadData(url)
        
        return response
    }
    
    /// get the total uploads per day over the past 30 days
    /// - Returns: an [Int] with the uploads per day
    func getUploadsPerDay() async -> UploadCountHistoryView?{
        
        let url = Endpoint.uploadsPerDay().url!
        let response: UploadCountHistoryView? = await loadData(url)
        
        return response
    }
    
}
