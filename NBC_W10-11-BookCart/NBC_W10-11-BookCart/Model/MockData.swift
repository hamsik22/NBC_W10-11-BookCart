//
//  MockData.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/27/24.
//

import Foundation

struct MockData {
    static let books: [MockBook] = [
        MockBook(title: "세이노의 가르침", author: "세이노", price: 14000),
        MockBook(title: "실용주의 프로그래머", author: "데이비드 토머스", price: 18000),
        MockBook(title: "실용주의 프로그래머", author: "데이비드 토머스", price: 18000),
        MockBook(title: "실용주의 프로그래머", author: "데이비드 토머스", price: 18000),
        MockBook(title: "실용주의 프로그래머", author: "데이비드 토머스", price: 18000),
        MockBook(title: "실용주의 프로그래머", author: "데이비드 토머스", price: 18000)]
}

struct MockBook {
    let title: String
    let author: String
    let price: Double
}
