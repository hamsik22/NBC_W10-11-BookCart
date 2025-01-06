//
//  BookCartView.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/24/24.
//

import UIKit

protocol BookCartViewDelegate: AnyObject {
    func didTapDeleteAllButton()
    func didTapAddBookButton()
}

class BookCartView: UIView {
    
    weak var delegate: BookCartViewDelegate?
    var bookListTable: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private let deleteAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체 삭제", for: .normal)
        button.setTitleColor(.black.withAlphaComponent(0.5), for: .normal)
        return button
    }()
    private let addBookButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        return button
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "담은 책"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - Functions
extension BookCartView {
    private func setup() {
        [
            deleteAllButton, addBookButton, titleLabel, bookListTable
        ].forEach { addSubview($0) }
        
        deleteAllButton.addTarget(self, action: #selector(didTapDeleteAllButton), for: .touchUpInside)
        addBookButton.addTarget(self, action: #selector(didTapAddBookButton), for: .touchUpInside)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        deleteAllButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalTo(titleLabel)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        addBookButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(titleLabel)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        bookListTable.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    @objc private func didTapDeleteAllButton() {
        print("View: didTapDeleteAllButton")
        delegate?.didTapDeleteAllButton()
    }
    @objc private func didTapAddBookButton() {
        print("View: didTapAddBookButton")
        delegate?.didTapAddBookButton()
    }
}

@available(iOS 17.0, *)
#Preview {
    BookCartVC()
}
