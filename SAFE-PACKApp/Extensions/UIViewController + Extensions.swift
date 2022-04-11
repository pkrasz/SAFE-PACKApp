//
//  UIViewController + Extensions.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 10/04/2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, actions: [UIAlertAction] = []) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions { alert.addAction(action) }
        present(alert, animated: true)
    }
}

