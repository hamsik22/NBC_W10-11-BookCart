//
//  UserDefaults+Ext.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 1/3/25.
//

import Foundation

extension UserDefaults {
    func saveBookData(_ bookData: [Document]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(bookData) {
            self.set(encoded, forKey: UserDefaultsKeys.bookList.rawValue)
        }
    }
    
    func loadBookData() -> [Document]? {
        if let savedData = self.data(forKey: UserDefaultsKeys.bookList.rawValue) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Document].self, from: savedData) {
                return decoded
            }
        }
        return nil
    }
}
