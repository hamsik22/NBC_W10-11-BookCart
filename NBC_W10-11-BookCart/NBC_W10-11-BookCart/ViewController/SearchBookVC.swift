//
//  SearchBookVC.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/23/24.
//

import UIKit

protocol SearchBookVCDelegate: AnyObject {
    func didSelectBook()
    func activateSearchBar()
    func updateRecentBook()
    func checkRecentBooks() -> Bool
}

class SearchBookVC: UIViewController {
    
    private let searchView = SearchBookView()
    private var books: [Document] = []
    private var recentBooks: [Document] = [] {
        didSet {
            print("recentBooks: \(recentBooks.count)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SearchBookVC")
        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchView.searchBar.text = ""
        self.activateSearchBar()
    }
    
}

// MARK: - Delegate
extension SearchBookVC: SearchBookVCDelegate {
    func checkRecentBooks() -> Bool {
        return self.recentBooks.isEmpty
    }
    
    func didSelectBook() {
        self.showAlert(title: "성공", message: "카트에 담았어요!")
    }
    func activateSearchBar() {
        self.searchView.searchBar.becomeFirstResponder()
    }
    func updateRecentBook() {
        print("updateRecentBook()")
        self.searchView.recentBookCollectionView.reloadData()
    }
}
extension SearchBookVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}

extension SearchBookVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recentBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchView.recentBookCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.identifier, for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        return cell
    }
}

// MARK: - Extensions
extension SearchBookVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchView.searchResultTableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as? TableCell else { return UITableViewCell() }
        
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
        let bookDetail = BookDetailVC()
        bookDetail.modalPresentationStyle = .formSheet
        bookDetail.bookInfo = books[indexPath.row]
        self.recentBooks.append(books[indexPath.row])
        
        if let tabBarController = self.tabBarController,
           let cartNav = tabBarController.viewControllers?[1] as? UINavigationController,
           let cartVC = cartNav.viewControllers.first as? BookCartVC {
            bookDetail.bookCartDelegate = cartVC
            bookDetail.searchBookDelegate = self
        }
        present(bookDetail, animated: true)
        // TODO: 셀을 터치했을 때, 최근 본 책으로 정보를 저장한다.
        updateRecentBook()
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
        view.endEditing(true)
    }
}
// MARK: - Functions
extension SearchBookVC {
    private func setup() {
        navigationController?.isNavigationBarHidden = true
        
        searchView.searchBar.delegate = self
        
        searchView.searchResultTableView.delegate = self
        searchView.searchResultTableView.dataSource = self
        searchView.searchResultTableView.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
        
        searchView.recentBookCollectionView.delegate = self
        searchView.recentBookCollectionView.dataSource = self
        searchView.recentBookCollectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
        
        
        view.addSubview(searchView)
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: SearchBookVC())
}
