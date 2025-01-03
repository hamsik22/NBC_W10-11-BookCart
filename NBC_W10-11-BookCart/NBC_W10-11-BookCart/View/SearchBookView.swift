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
        searchBar.placeholder = "검색하기"
        searchBar.searchTextField.backgroundColor = .systemBackground
        searchBar.layer.borderWidth = 3
        searchBar.layer.cornerRadius = 20
        return searchBar
    }()
    
    private let resultBookLabel: UILabel = {
        let label = UILabel()
        label.text = "검색 결과"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    let searchResultTableView: UITableView = {
        let view = UITableView()
        return view
    }()
    // TODO: latestBook: UICollectionView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions
extension SearchBookView {
    private func setup() {
        [searchBar, resultBookLabel, searchResultTableView]
            .forEach{ addSubview($0)}
                
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        resultBookLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        searchResultTableView.snp.makeConstraints { make in
            make.top.equalTo(resultBookLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(10)
        }
    }
}


@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: SearchBookVC())
}
