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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("BookDetailVC")
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

@available(iOS 17.0, *)
#Preview {
    BookDetailVC()
}
