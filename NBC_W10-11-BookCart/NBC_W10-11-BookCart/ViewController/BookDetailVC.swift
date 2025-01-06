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
    var bookInfo: Document?
    weak var bookDetailDelegate: BookDetailDelegate?
    weak var bookCartDelegate: BookCartVCDelegate?
    weak var searchBookDelegate: SearchBookVCDelegate?

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

// MARK: - Extensions
extension BookDetailVC: BookDetailDelegate {
    func exitButtonTapped() {
        dismiss(animated: true)
    }
    
    func addCartButtonTapped() {
        guard let item = bookInfo else { return }
        print("addCartButtonTapped")
        bookCartDelegate?.addBookItem(item: item)
        dismiss(animated: true)
        searchBookDelegate?.didSelectBook()
    }
}
extension BookDetailVC: SearchBookVCDelegate {
    func checkRecentBooks() -> Bool { return true }
    
    func updateRecentBook() { }
    
    func activateSearchBar() { }
    
    func didSelectBook() {
        searchBookDelegate?.didSelectBook()
    }
}


@available(iOS 17.0, *)
#Preview {
    BookDetailVC()
}
