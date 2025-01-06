//
//  UIViewController+Ext.swift
//  NBC_W10-11-BookCart
//
//  Created by 황석현 on 1/6/25.
//

import UIKit

extension UIViewController {
    func showAlert(title: String = "경고", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
