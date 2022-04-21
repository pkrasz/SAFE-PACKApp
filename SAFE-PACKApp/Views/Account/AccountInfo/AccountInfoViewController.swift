//
//  RegisterViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

final class AccountInfoViewController: BaseViewController<AccountView> {
    
    //MARK: - Properites
    
    var newUser: Bool
    
    //MARK: - Initializator
    
    init(newUser: Bool) {
        self.newUser = newUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    override func setupView() {
        contentView.emailLabel.text = UserSession.shared.UserInfo(about: User.email)
        
        if newUser == true {
            showAlert(title: "Complete the registration", message: "Fill in the necessary data to go to the account", actions: [UIAlertAction(title: "Continue", style: .default, handler: nil)])
        } else {
            FirebaseClient.shared.getAccountInfo(userUID: UserSession.shared.UserInfo(about: User.id)) { [weak self] userInfo in
                self?.contentView.nameTextField.text = userInfo.companyName
                self?.contentView.NIPTextField.text = String(userInfo.NIP)
                self?.contentView.deliveryAddressTextField.text = userInfo.address
            }
        }
    }
    
    override func setupBindings() {
        
        let tapApproveButton = UIAction { [unowned self] _ in
            
            let name = contentView.nameTextField.text
            let NIP = contentView.NIPTextField.text
            let address = contentView.deliveryAddressTextField.text
            guard let name = name else { return }
            guard let NIP = NIP else { return }
            guard let address = address else { return }
            
            if newUser == false {
                FirebaseClient.shared.updateUserInfo(userUID: UserSession.shared.UserInfo(about: User.id), name: name, NIP: Int(NIP) ?? 0, address: address)
                
                showAlert(title: "You made a chenge info", message: "Name: \(name), NIP: \(NIP), Delivery address: \(address)", actions: [UIAlertAction(title: "Close", style: .default, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })])
            } else {
                FirebaseClient.shared.createUserInfo(userUID: UserSession.shared.UserInfo(about: User.id), name: name, NIP: Int(NIP) ?? 0, address: address)
                newUser = false
                showAlert(title: "You have complete registration", message: "Name: \(name), NIP: \(NIP), Delivery address: \(address)", actions: [UIAlertAction(title: "Go to profile", style: .default, handler: { (action) in self.navigationController?.popToRootViewController(animated: false)
                })])
            }
        }
        contentView.approveButton.addAction(tapApproveButton, for: .touchUpInside)
    }
}
