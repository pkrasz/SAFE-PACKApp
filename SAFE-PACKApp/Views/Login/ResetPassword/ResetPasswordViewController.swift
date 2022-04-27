//
//  ResetPasswordViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 25/04/2022.
//

import UIKit

final class ResetPasswordViewController: BaseViewController<ResetPasswordView> {
    
    //MARK: - Setup
    
    override func setupBindings() {
        let tapResetPassword = UIAction { [unowned self] _ in
            let email = contentView.emailTextField.text
            var error: String?
            var success: Bool? {
                didSet {
                    if success == false {
                        guard let error = error else {return}
                        showAlert(title: Alert.Title.error, message: error, actions: [Alert.Action.close])
                    } else {
                        showAlert(title: Alert.Title.correct, message: Alert.Messege.correctPasswordReset, actions: [UIAlertAction(title: Alert.ActionTitle.close, style: .default, handler: { (action) in
                            self.navigationController?.popToRootViewController(animated: true)
                        })])
                    }
                }
            }
            guard let email = email else {return}
            UserSession.shared.userResetPassword(email: email) { errorMessege, status in
                error = errorMessege
                success = status
            }
        }
        contentView.resetPasswordButton.addAction(tapResetPassword, for: .touchUpInside)
    }
}
