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
    
    public struct Schedule: Codable, Hashable, Sendable {
        public let day: String
        public let open: String
        public let close: String
    }
    
    public let _id: String
    public var id: String { _id }

    public let title: String
    public let type: String
    public let description: String
    public let address: String
    public let schedule: [Schedule]
    
    public init(_id: String, title: String, type: String, description: String, address: String, schedule: [Schedule]) {
        self._id = _id
        self.title = title
        self.type = type
        self.description = description
        self.address = address
        self.schedule = schedule
    }
}

