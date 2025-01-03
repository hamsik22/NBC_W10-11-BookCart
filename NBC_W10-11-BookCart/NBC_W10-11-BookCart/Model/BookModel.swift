//
//  BookData.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/27/24.
//

import Foundation

//struct BookInfo: Codable {
//    let title: String
//    let authors: [String]
//    let price: Int
//    let thumbnail: String
//    let contents: String
//}
//
//struct BookData: Codable {
//    let documents: [BookInfo]
//}

import Foundation

// MARK: - BookInfo
struct BookData: Codable {
    let meta: Meta
    let documents: [Document]
}

// MARK: - Document
struct Document: Codable {
    let authors: [String]
    let contents, datetime, isbn: String
    let price: Int
    let publisher: String
    let salePrice: Int
    let status: String
    let thumbnail: String
    let title: String
    let translators: [String]
    let url: String

    enum CodingKeys: String, CodingKey {
        case authors, contents, datetime, isbn, price, publisher
        case salePrice = "sale_price"
        case status, thumbnail, title, translators, url
    }
}

// MARK: - Meta
struct Meta: Codable {
    let isEnd: Bool
    let pageableCount, totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}

enum UserDefaultsKeys: String {
    case bookList
    case bookCart
}
