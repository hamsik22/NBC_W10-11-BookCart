//
//  BookDetailVC.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/23/24.
//

import UIKit
import SnapKit

class BookDetailView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목 레이블"
        label.backgroundColor = .blue
        return label
    }()
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "작가 이름"
        label.backgroundColor = .brown
        return label
    }()
    private let bookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "book")
        imageView.backgroundColor = .cyan
        return imageView
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "가격 레이블"
        label.backgroundColor = .red
        return label
    }()
    private let descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.text = "책 설명란"
        textView.backgroundColor = .yellow
        return textView
    }()
    private let exitButton: UIButton = {
       let button = UIButton()
        button.setTitle("X", for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()
    private let addCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("담기", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [
            titleLabel, authorLabel, bookImage, priceLabel, descriptionLabel, exitButton, addCartButton
        ].forEach{ addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        bookImage.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(350)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(bookImage.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(100)
        }
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.width.equalTo(60)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(10)
        }
        addCartButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.leading.equalTo(exitButton.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    BookDetailVC()
}
