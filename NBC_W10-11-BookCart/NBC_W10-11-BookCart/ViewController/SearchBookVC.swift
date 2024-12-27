//
//  SearchBookVC.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/23/24.
//

import UIKit

class SearchBookVC: UIViewController {
    
    private let searchView = SearchBookView()
    private var books: [BookInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    private func setup() {
        navigationController?.isNavigationBarHidden = true
        searchView.searchResultTableView.delegate = self
        searchView.searchResultTableView.dataSource = self
        searchView.searchResultTableView.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.identifier)
        searchView.searchBar.delegate = self
        
        view.addSubview(searchView)
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK: - Extensions
extension SearchBookVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchView.searchResultTableView.dequeueReusableCell(withIdentifier: SearchResultCell.identifier, for: indexPath) as? SearchResultCell else { return UITableViewCell() }
        
        cell.configure(title: self.books[indexPath.row].title, author: self.books[indexPath.row].authors, price: String(self.books[indexPath.row].price))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
extension SearchBookVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchView.searchResultTableView.deselectRow(at: indexPath, animated: true)
    }
}
extension SearchBookVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchView.searchBar.searchTextField.text else { return }
        print("\(text) 검색")
        BookManager.shared.fetchBookSummaries(searchValue: text) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    self?.books = books
                    self?.searchView.searchResultTableView.reloadData()
                case .failure(let error):
                    print("fetchBook Error :\(error)")
                }
            }
        }
    }
}

// MARK: - Preview
@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: SearchBookVC())
}
