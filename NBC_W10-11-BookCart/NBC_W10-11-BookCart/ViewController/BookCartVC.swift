//
//  BookCart.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 12/23/24.
//

import UIKit

protocol BookCartVCDelegate: AnyObject {
    func addBookItem(item: Document)
}

class BookCartVC: UIViewController {
    
    weak var searchVCDelegate: SearchBookVCDelegate?
    weak var bookCartVCDelegate: BookCartVCDelegate?
    let bookCart = BookCartView()
    var bookList: [Document] = [] {
        didSet {
            updateBookList()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BookCart DidLoad")
        fetchBookList()
        print("BookList: \(bookList)")
        setup()
    }
}

// MARK: - Extensions
extension BookCartVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 삭제 액션 정의
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { _, _, completionHandler in
            self.bookList.remove(at: indexPath.row) // 데이터 삭제
            tableView.deleteRows(at: [indexPath], with: .automatic) // 셀 삭제
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red // 버튼 색상 설정
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true // 전체 스와이프 허용 여부
        
        return configuration
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
extension BookCartVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = bookCart.bookListTable.dequeueReusableCell(withIdentifier: TableCell.identifier) as? TableCell else { return UITableViewCell() }
        cell.configure(title: self.bookList[indexPath.row].title, author: self.bookList[indexPath.row].authors, price: String(self.bookList[indexPath.row].price))
        
        return cell
    }
}
// MARK: - Functions
extension BookCartVC {
    private func setup() {
        navigationController?.isNavigationBarHidden = true
        bookCart.bookListTable.delegate = self
        bookCart.bookListTable.dataSource = self
        bookCart.bookListTable.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
        bookCart.delegate = self
        
        view.addSubview(bookCart)
        
        bookCart.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
        }
    }
}
// MARK: - Delegate
extension BookCartVC: BookCartViewDelegate {
    func didTapDeleteAllButton() {
        self.bookList.removeAll()
        print("전체 삭제: \(bookList)")
        self.bookCart.bookListTable.reloadData()
    }
    
    func didTapAddBookButton() {
        print("추가")
        tabBarController?.selectedIndex = 0
        searchVCDelegate?.activateSearchBar()
    }

}
extension BookCartVC: BookCartVCDelegate {
    func addBookItem(item: Document) {
        bookList.append(item)
        print("\(item.title) 추가되었습니다. count:\(bookList.count)")
        bookCart.bookListTable.reloadData()
    }
}

//MARK: - Functions
extension BookCartVC {
    func fetchBookList() {
        guard let bookList = UserDefaults.standard.loadBookData() else { return }
        self.bookList = bookList
        self.bookCart.bookListTable.reloadData()
    }
    func updateBookList() {
        UserDefaults.standard.saveBookData(bookList)
        guard let data = UserDefaults.standard.data(forKey: "bookList") else { return }
        print("updateBookList: \(data)")
    }
}
