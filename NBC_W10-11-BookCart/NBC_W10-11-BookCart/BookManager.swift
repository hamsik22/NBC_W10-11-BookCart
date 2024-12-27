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
    
    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKey") as! String
    
    func testAPIKeys() {
//        let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=\(value)")!
        let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=기시미 이치로")!
        
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = ["Authorization": "KakaoAK \(apiKey)"]
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
          print(String(data: data!, encoding: .utf8))
        }.resume()
    }
    
    func fetchBookSummaries(searchValue: String ,completion: @escaping (Result<[BookInfo], Error>) -> Void) {
        let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=\(searchValue)")!
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = ["Authorization": "KakaoAK \(apiKey)"]
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(BookData.self, from: data)
                    completion(.success(response.documents))
                    print(String(data: data, encoding: .utf8))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
}
