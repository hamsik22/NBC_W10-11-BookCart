//
//  CollectionCell.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 1/5/25.
//

import UIKit
import SnapKit

class CollectionCell: UICollectionViewCell {
    
    static let identifier = "CollectionCell"
    
    let bookThumbnail: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup
    private func setup() {
        self.addSubview(bookThumbnail)
        bookThumbnail.frame = contentView.bounds
        bookThumbnail.clipsToBounds = true
        bookThumbnail.layer.cornerRadius = bookThumbnail.frame.height / 2
        
    }
    
    func configure(url: String?) {
        bookThumbnail.loadImage(from: url) {
            
        } failure: { error in
        if let error = error {
                print("can't load Image: \(error)")
        } else { print("Unknown error") }
            
        }

    }
}
