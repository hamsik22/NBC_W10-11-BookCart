//
//  UIImageView+Ext.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 1/5/25.
//

import UIKit

extension UIImageView {
    func loadImage(
        from url: String?,
        completion: (() -> Void)? = nil,
        failure: ((Error?) -> Void)? = nil
    ) {
        guard let urlString = url, let imageURL = URL(string: urlString) else {
            print("❌ Invalid URL")
            failure?(nil)
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { [weak self] data, response, error in
            if let error = error {
                print("❌ Network Error: \(error.localizedDescription)")
                failure?(error)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("❌ Invalid Image Data")
                failure?(nil)
                return
            }
            
            DispatchQueue.main.async {
                self?.image = image
                completion?()
            }
        }.resume()
    }
}
