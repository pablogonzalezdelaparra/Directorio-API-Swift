// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct DirectorioAPI: Sendable {
    
    private let session = URLSession.shared
    private let jsonDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    private let baseURL = "http://localhost:8080"
    
    public init() {}
    
    public func getBusinesses() async throws -> [Business] {
        guard let urlComponents =  URLComponents(string: "\(baseURL)/business/getAllBusinesses") else {
            throw APIError.invalidURL
        }
        
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        
        let (response, statusCode): (BusinessResponse, Int) = try await fetch(url)
        if !response.isSuccessful {
            throw APIError.httpStatusCodeFailed(statusCode: statusCode, error: response.message ?? "Fail")
        }
        
        return response.data?.businesses ?? []
    }
    
    public func searchBusinessesByTitle(name: String) async throws -> [Business] {
        guard var urlComponents =  URLComponents(string: "\(baseURL)/business/searchBusinessesByName") else {
            throw APIError.invalidURL
        }
        
        urlComponents.queryItems = [
            .init(name: "name", value: name)
        ]
        
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        
        let (response, statusCode): (BusinessResponse, Int) = try await fetch(url)
        if !response.isSuccessful {
            throw APIError.httpStatusCodeFailed(statusCode: statusCode, error: response.message ?? "Fail")
        }
        
        return response.data?.businesses ?? []
    }
    
    private func fetch<D: Decodable>(_ url: URL) async throws -> (D, Int) {
        let (data, response) = try await session.data(from: url)
        let statusCode = try validateHTTPResponse(response)
        return (try jsonDecoder.decode(D.self, from: data), statusCode)
    }
    
    private func validateHTTPResponse(_ response: URLResponse) throws -> Int {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponseType
        }
        
        guard 200...299 ~= httpResponse.statusCode ||
                400...499 ~= httpResponse.statusCode else {
            throw APIError.httpStatusCodeFailed(statusCode: httpResponse.statusCode, error:nil)
        }
        return httpResponse.statusCode
    }
}
