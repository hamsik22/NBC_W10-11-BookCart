//
//  BooKDetailVC.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 1/2/25.
//

import UIKit
import SnapKit

class BookDetailVC: UIViewController {
    
    let bookDetail = BookDetailView()
    var bookInfo: BookInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("BookDetailVC")
        bookDetail.delegate = self
        bookDetail.bookInfo = bookInfo
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(bookDetail)
        
        bookDetail.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

// MARK: - Delegate
extension BookDetailVC: BookDetailDelegate {
    func exitButtonTapped() {
        dismiss(animated: true)
    }
    
    func addCartButtonTapped() {
        print("addCartButtonTapped")
    }
    
    
}

@available(iOS 17.0, *)
#Preview {
    BookDetailVC()
}
