//
//  Business.swift
//  DirectorioAPI
//
//  Created by Pablo González de la Parra on 26/03/25.
//

import Foundation

public struct BusinessResponse: Decodable {
    public let status: String
    public let data: BusinessData?
    public let message: String?
    
    public var isSuccessful: Bool {
        status.lowercased() == "success"
    }
}

public struct BusinessData: Codable {
    public let businesses: [Business]?
}

public struct Business: Codable, Identifiable, Hashable, Sendable {
    public let _id: String
    public var id: String { _id }
    
    public let symbol: String
    public let name: String
    public let description: String?
    public let rating: Double
    public let ratingChange: Double
    
    public init(_id: String, symbol: String, name: String, description: String?, rating: Double, ratingChange: Double) {
        self._id = _id
        self.symbol = symbol
        self.name = name
        self.description = description
        self.rating = rating
        self.ratingChange = ratingChange
    }
}
