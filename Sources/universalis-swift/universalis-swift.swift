import Foundation

public class UniversalisClient{
    
    public init(){
        
    }
}

public extension UniversalisClient{
    
    typealias UniversalisResponse<T: Decodable> = (result: T?, statusCode: Int?, error: APIError?)
    /// get all data centers supported by the API
    /// - Returns: data centers
    func getDataCenters() async -> UniversalisResponse<[DataCenter]>{
        
        let url = Endpoint.dataCenters().url!
        let response: UniversalisResponse<[DataCenter]> = await loadData(url)
        
        return response
    }
    
    /// get the IDs and names of all worlds supported by the API
    /// - Returns: worlds
    func getWorlds() async -> UniversalisResponse<[World]>{
        
        let url = Endpoint.worlds().url!
        let response: UniversalisResponse<[World]> = await loadData(url)
        
        return response
    }
    
    /// get the least-recently updated items on the specified world or data center
    /// - Parameters:
    ///   - world: the world/data center to request data for
    ///   - entries: the number of entries to return (default 50, max 200)
    /// - Returns: the least-recently updated items
    func getLeastRecentlyUpdated(world: String, entries: Int = 50) async -> UniversalisResponse<MostRecentlyUpdatedItemsView>{
        
        let queryItems = [
            URLQueryItem(name: "world", value: world),
            URLQueryItem(name: "entries", value: entries.description)
        ]
        let url = Endpoint.leastRecentlyUpdated(world: world, queryItems: queryItems).url!
        let response: UniversalisResponse<MostRecentlyUpdatedItemsView> = await loadData(url)
        
        return response
    }
    
    /// get the data currently shown on the market board for the requested item
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemId: the item to retrieve data for
    ///   - queryItems: the following queries are supported:
    ///   - listings (query): the number of listings to return per item, default is all listings
    ///   - entries (query): the number of recent history entries to return per item, default 5
    ///   - hq (query): filter for HQ listings and entries. By default, both HQ and NQ listings will be returned
    ///   - statsWithin (query): the amount of time before now to calculate stats over, in milliseconds, default 7 days
    ///   - entriesWithin (query): the amount of time before now to take entries within, in seconds, default 7 days
    ///   - fields (query): a comma separated list of fields that should be included in the response, if ommitted will return all fields. For example if you're only interested in the listings price per unit you can set this to listings.pricePerUnit
    /// - Returns: current market board data
    func getCurrentData(worldDcRegion: String, itemId: Int, queryItems: [URLQueryItem]) async -> UniversalisResponse<CurrentlyShownView>{
        
        let url = Endpoint.currentData(worldDcRegion: worldDcRegion, itemId: itemId, queryItems: queryItems).url!
        let response: UniversalisResponse<CurrentlyShownView> = await loadData(url)

        return response
    }
    
    
    /// get the data currently shown on the market board for the requested item
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemId: the item to retrieve data for
    ///   - queries: queries supported by this endpoint
    /// - Returns: current market board data
    func getCurrentData(worldDcRegion: String, itemId: Int, queries: [CurrentQuery]? = nil) async -> UniversalisResponse<CurrentlyShownView>{
        let queryItems = queries?.map { $0.queryItem }
        let url = Endpoint.currentData(worldDcRegion: worldDcRegion, itemId: itemId, queryItems: queryItems).url!
        let response: UniversalisResponse<CurrentlyShownView> = await loadData(url)
        
        return response
    }
    
    
    /// get the data currently shown on the market board for the requested items
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemIds: the items to retrieve data for
    ///   - queryItems: the following queries are supported:
    ///   - listings (query): the number of listings to return per item, default is all listings
    ///   - entries (query): the number of recent history entries to return per item, default 5
    ///   - hq (query): filter for HQ listings and entries. By default, both HQ and NQ listings will be returned
    ///   - statsWithin (query): the amount of time before now to calculate stats over, in milliseconds, default 7 days
    ///   - entriesWithin (query): the amount of time before now to take entries within, in seconds, default 7 days
    ///   - fields (query): a comma separated list of fields that should be included in the response, if ommitted will return all fields. For example if you're only interested in the listings price per unit you can set this to listings.pricePerUnit
    /// - Returns: current market board data
    func getCurrentData(worldDcRegion: String, itemIds: [Int], queryItems: [URLQueryItem]) async -> UniversalisResponse<CurrentlyShownMultiViewV2>{
        
        let url = Endpoint.currentData(worldDcRegion: worldDcRegion, itemIds: itemIds, queryItems: queryItems).url!
        let response: UniversalisResponse<CurrentlyShownMultiViewV2> = await loadData(url)
        
        return response
    }
    
    /// get the data currently shown on the market board for the requested items
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemIds: the items to retrieve data for
    ///   - queries: queries supported by this endpoint
    /// - Returns: current market board data
    func getCurrentData(worldDcRegion: String, itemIds: [Int], queries: [CurrentQuery]? = nil) async -> UniversalisResponse<CurrentlyShownMultiViewV2>{
        
        let queryItems = queries?.map { $0.queryItem }
        let url = Endpoint.currentData(worldDcRegion: worldDcRegion, itemIds: itemIds, queryItems: queryItems).url!
        let response: UniversalisResponse<CurrentlyShownMultiViewV2> = await loadData(url)
        
        return response
    }
    
    func getAggregatedData(worldDcRegion: String, itemIds: [Int]) async -> UniversalisResponse<AggregatedMarketBoardData>{
        
        let url = Endpoint.aggregatedData(worldDcRegion: worldDcRegion, itemIds: itemIds).url!
        let response: UniversalisResponse<AggregatedMarketBoardData> = await loadData(url)
        
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
    func getHistory(worldDcRegion: String, itemId: Int, queryItems: [URLQueryItem]) async -> UniversalisResponse<HistoryView>{
        
        let url = Endpoint.history(worldDcRegion: worldDcRegion, itemId: itemId, queryItems: queryItems).url!
        let response: UniversalisResponse<HistoryView> = await loadData(url)
        
        return response
    }
    
    /// get the history data for the requested item
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemId: the item to retrieve data for
    ///   - queries: queries supported by this endpoint
    /// - Returns: market history data
    func getHistory(worldDcRegion: String, itemId: Int, queries: [HistoryQuery]? = nil) async -> UniversalisResponse<HistoryView>{
        
        let queryItems = queries?.map { $0.queryItem }
        let url = Endpoint.history(worldDcRegion: worldDcRegion, itemId: itemId, queryItems: queryItems).url!
        let response: UniversalisResponse<HistoryView> = await loadData(url)
        
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
    func getHistory(worldDcRegion: String, itemIds: [Int], queryItems: [URLQueryItem]) async -> UniversalisResponse<HistoryMultiViewV2>{
        
        let url = Endpoint.history(worldDcRegion: worldDcRegion, itemIds: itemIds, queryItems: queryItems).url!
        let response: UniversalisResponse<HistoryMultiViewV2> = await loadData(url)
        
        return response
    }
    
    /// get the history data for the requested items
    /// - Parameters:
    ///   - worldDcRegion: the world, data center or region to retrieve data for
    ///   - itemIds: the items to retrieve data for
    ///   - queries: queries supported by this endpoint
    /// - Returns: market history data
    func getHistory(worldDcRegion: String, itemIds: [Int], queries: [HistoryQuery]? = nil) async -> UniversalisResponse<HistoryMultiViewV2>{
        
        let queryItems = queries?.map { $0.queryItem }
        let url = Endpoint.history(worldDcRegion: worldDcRegion, itemIds: itemIds, queryItems: queryItems).url!
        let response: UniversalisResponse<HistoryMultiViewV2> = await loadData(url)
        
        return response
    }
    
    
    /// get the current tax rate data for the specified world. This data is provided by the Retainer Vocate in each major city.
    /// - Parameter world: the world to retrieve data for
    /// - Returns: tax rates
    func getTaxRates(world: String) async -> UniversalisResponse<TaxRatesView>{
        
        let url = Endpoint.taxRates(world: world).url!
        let response: UniversalisResponse<TaxRatesView> = await loadData(url)
        
        return response
    }
    
    /// get an array of all marketable items
    /// - Returns: [Int] of all marketable items
    func getMarketableItems() async -> UniversalisResponse<[Int]> {
        
        let url = Endpoint.marketableItems().url!
        let response: UniversalisResponse<[Int]> = await loadData(url)
        
        return response
    }
    
    /// get the most-recently updated items on the specified world or data-center, along with the upload times for each item
    /// - Parameters:
    ///   - world: the world/data center to request data for
    ///   - entries: the number of entries to return (default 50, max 200)
    /// - Returns: the most-recently updated items
    func getMostRecentlyUpdated(world: String, entries: Int = 50) async -> UniversalisResponse<MostRecentlyUpdatedItemsView>{
        
        let queryItems = [
            URLQueryItem(name: "world", value: world),
            URLQueryItem(name: "entries", value: entries.description)
        ]
        let url = Endpoint.mostRecentlyUpdated(world: world, queryItems: queryItems).url!
        let response: UniversalisResponse<MostRecentlyUpdatedItemsView> = await loadData(url)
        
        return response
    }
    
    /// get the total upload count of the uploader applications
    /// - Returns: array with the name and upload count for each application
    func getUploadsByApplication() async -> UniversalisResponse<[SourceUploadCountView]> {
        
        let url = Endpoint.uploadsByApplication().url!
        let response: UniversalisResponse<[SourceUploadCountView]> = await loadData(url)
        
        return response
    }
    
    /// get the total upload count and proportion for each world
    /// - Returns: Dictionary with the server name and the  count/proportion of the uploads
    func getUploadsByWorld() async -> UniversalisResponse<[String : WorldUploadCounts]>{
        
        let url = Endpoint.uploadsByWorld().url!
        let response: UniversalisResponse<[String : WorldUploadCounts]> = await loadData(url)
        
        return response
    }
    
    /// get the total uploads per day over the past 30 days
    /// - Returns: an [Int] with the uploads per day
    func getUploadsPerDay() async -> UniversalisResponse<UploadCountHistoryView>{
        
        let url = Endpoint.uploadsPerDay().url!
        let response: UniversalisResponse<UploadCountHistoryView> = await loadData(url)
        
        return response
    }
    
}
