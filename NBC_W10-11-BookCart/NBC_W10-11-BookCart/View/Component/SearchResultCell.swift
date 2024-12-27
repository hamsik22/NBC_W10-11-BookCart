//
//  SearchResultCell.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/27/24.
//

import UIKit
import SnapKit

class SearchResultCell: UITableViewCell {
    
    static let identifier: String = "SearchResultCell"
    
    private let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUp
    private func setup() {
        [bookTitleLabel, authorLabel, priceLabel]
            .forEach { addSubview($0) }
        
        bookTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(60)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(bookTitleLabel.snp.trailing).offset(10)
            make.height.equalTo(60)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(60)
        }
    }
    
    func configure(title: String, author: [String], price: String) {
        bookTitleLabel.text = title
        authorLabel.text = author.joined(separator: "\n")
        priceLabel.text = price
    }
    
}
