//
//  BookManager.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/27/24.
//

import Foundation

class BookManager {
    static let shared = BookManager()
    private init () { }
    
    private let apiKeys = Bundle.main.object(forInfoDictionaryKey: "APIKeys") as! String
    
    func getBookList(title: String) {
        
        let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=\(title)")!

        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = ["Authorization": "KakaoAK \(apiKeys)"]
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            print(String(data: data!, encoding: .utf8))
        }.resume()
    }
}
