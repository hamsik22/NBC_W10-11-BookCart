//
//  SearchBookVC.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/23/24.
//

import UIKit

class SearchBookVC: UIViewController {
    
    private let searchView = SearchBookView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(searchView)
        
        searchView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
