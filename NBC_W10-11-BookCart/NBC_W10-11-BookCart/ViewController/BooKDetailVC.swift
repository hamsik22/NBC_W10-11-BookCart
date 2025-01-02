//
//  BooKDetailVC.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 1/2/25.
//

import UIKit
import SnapKit

class BooKDetailVC: UIViewController {
    
    let bookDetail = BookDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.addSubview(bookDetail)
        
        bookDetail.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }

}

@available(iOS 17.0, *)
#Preview {
    BooKDetailVC()
}
