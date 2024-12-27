//
//  SearchBookView.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/24/24.
//

import UIKit
import SnapKit

class SearchBookView: UIView {
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search..."
        searchBar.searchTextField.backgroundColor = .systemBackground
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.clipsToBounds = true
        return searchBar
    }()
    
    let recentBookLabel: UILabel = {
        let label = UILabel()
        label.text = "Search Book"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemBackground
        label.backgroundColor = .red
        return label
    }()
    // TODO: latestBook: UICollectionView
    // TODO: searchResultLabel: UILabel
    // TODO: searchResultTableView: UITableView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(recentBookLabel)
        addSubview(searchBar)
        
        recentBookLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(recentBookLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
