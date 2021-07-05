//
//  HistoryEntity.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation

// MARK: - Welcome
struct HistoryEntityResponse: Codable {
    let status: Int
    let message: String
    let data: [HistoryEntityDataResponse]
}

// MARK: - Datum
struct HistoryEntityDataResponse: Codable {
    let id, sender, receiver: Int
    let name, phone, image, type: String
    let amount: Int
    let notes, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, sender, receiver, name, phone, image, type, amount, notes
        case createdAt = "created_at"
    }
}
