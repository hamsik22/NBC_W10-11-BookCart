//
//  BookDetailVC.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/23/24.
//

import UIKit
import SnapKit

protocol BookDetailDelegate: AnyObject {
    func exitButtonTapped()
    func addCartButtonTapped()
}

class BookDetailView: UIView {
    
    weak var delegate: BookDetailDelegate?
    var bookInfo: Document? {
        didSet {
            titleLabel.text = bookInfo?.title
            authorLabel.text = bookInfo?.authors.joined(separator: "\n")
            loadImage(url: bookInfo?.thumbnail)
            priceLabel.text = "\(bookInfo?.price ?? 0000)"
            descriptionLabel.text = bookInfo?.contents
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목 레이블"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "작가 이름"
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    private let bookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "book")
        return imageView
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "가격 레이블"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    private let descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.text = "책 설명란"
        return textView
    }()
    private let exitButton: UIButton = {
       let button = UIButton()
        button.setTitle("X", for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 15
        return button
    }()
    private let addCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("담기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 15
        return button
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
extension BookDetailView {
    private func setup() {
        
        // Add SubViews
        [titleLabel, authorLabel, bookImage, priceLabel, descriptionLabel, exitButton, addCartButton
        ].forEach{ addSubview($0) }
        
        // Add Target
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        addCartButton.addTarget(self, action: #selector(addCartButtonTapped), for: .touchUpInside)
        
        // Layouts
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        bookImage.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(300)
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
            make.height.equalTo(150)
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
    private func loadImage(url: String?) {
        guard let urlString = url else {
            print("No URL")
            return }
        guard let url = URL(string: urlString) else {
            print("Wrong URL")
            return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("NetworkError: \(error.localizedDescription)")
            }
            guard let data = data, let image = UIImage(data: data) else {
                print("Can't get Image")
                return
            }
            
            DispatchQueue.main.async {
                self?.bookImage.image = image
            }
        }.resume()
    }
    @objc private func exitButtonTapped() {
        delegate?.exitButtonTapped()
    }
    @objc private func addCartButtonTapped() {
        delegate?.addCartButtonTapped()
    }
}

@available(iOS 17.0, *)
#Preview {
    BookDetailVC()
}
