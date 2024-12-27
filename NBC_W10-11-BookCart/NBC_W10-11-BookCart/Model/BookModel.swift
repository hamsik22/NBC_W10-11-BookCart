//
//  BookData.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/27/24.
//

import Foundation

struct BookInfo: Codable {
    let title: String
    let authors: [String]
    let price: Int
    let thumbnail: String
    let contents: String
}

struct BookData: Codable {
    let documents: [BookInfo]
}
