//
//  SearchBookView.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/24/24.
//

import UIKit
import SnapKit

class SearchBookView: UIView {
    
    weak var delegate: SearchBookVCDelegate?
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "검색하기"
        searchBar.searchTextField.backgroundColor = .systemBackground
        searchBar.layer.borderWidth = 3
        searchBar.layer.cornerRadius = 20
        return searchBar
    }()
    private let searchResultSectionLabel: UILabel = {
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
    private let recentBookSectionLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 본 책"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    let recentBookCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // 📍 가로 스크롤 설정
        layout.minimumLineSpacing = 10 // 셀 사이 간격
        layout.minimumInteritemSpacing = 10 // 아이템 간 간격
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWithRecentBooks()
        checkFuntions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions
extension SearchBookView {
    private func setup() {
        [searchBar,
         searchResultSectionLabel, searchResultTableView]
            .forEach{ addSubview($0)}
                
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        searchResultSectionLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        searchResultTableView.snp.makeConstraints { make in
            make.top.equalTo(searchResultSectionLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(10)
        }
    }
    private func setupWithRecentBooks() {
        [searchBar,
         recentBookSectionLabel, recentBookCollectionView,
         searchResultSectionLabel, searchResultTableView]
            .forEach{ addSubview($0)}
                
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        recentBookSectionLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        recentBookCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recentBookSectionLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        searchResultSectionLabel.snp.makeConstraints { make in
            make.top.equalTo(recentBookCollectionView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        searchResultTableView.snp.makeConstraints { make in
            make.top.equalTo(searchResultSectionLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(10)
        }
    }
    private func checkFuntions() {
        guard let condition = delegate?.checkRecentBooks() else { return }
        if condition {
            print("it's True")
        } else {
            print("it's False")
        }
    }
}


@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: SearchBookVC())
}
