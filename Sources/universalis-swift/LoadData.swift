import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public enum APIError: Error {
    case badResponse(Int)
    case decodingError(Error)
    case networkError(Error)
}

public func loadData<T: Decodable>(_ url: URL) async -> (result: T?, statusCode: Int?, error: APIError?) {
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            return (nil, nil, .badResponse(-1))
        }
        
        let statusCode = httpResponse.statusCode
        if (200...299).contains(statusCode) {
            let decoder = JSONDecoder()
            do {
                let decoded = try decoder.decode(T.self, from: data)
                return (decoded, statusCode, nil)
            } catch {
                return (nil, statusCode, .decodingError(error))
            }
        } else {
            return (nil, statusCode, .badResponse(statusCode))
        }
        
    } catch {
        return (nil, nil, .networkError(error))
    }
}

