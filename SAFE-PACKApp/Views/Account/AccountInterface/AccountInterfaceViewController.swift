//
//  AccountInterfaceViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 11/04/2022.
//

import UIKit

final class AccountInterfaceViewController: BaseViewController<AccountInterfaceView> {
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        FirebaseClient.shared.getAccountInfo(userUID: UserSession.shared.UserInfo(about: User.id)) { [weak self] userInfo in
            self?.contentView.nameLabel.text = userInfo.companyName
        }
        contentView.emailLabel.text = UserSession.shared.UserInfo(about: User.email)
    }
    
    //MARK: - Setup
    
    override func setupView() {
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem?.isEnabled = true
        navigationController?.isNavigationBarHidden = false
        
        contentView.ordersInProgressLabel.text = "3"
        contentView.unpaidInvoicesLabel.text = "1"
        
        navigationItem.rightBarButtonItem = contentView.infoButton
        
    }
    
    override func setupBindings() {
        
        contentView.infoButton.target = self
        contentView.infoButton.action = #selector(tapInfoButton)
        
        let tapLogOutButton = UIAction{ [unowned self] _ in
            UserSession.shared.logOut()
            self.navigationController?.popToRootViewController(animated: true)
        }
        contentView.logOutButton.addAction(tapLogOutButton, for: .touchUpInside)
        
        let tapAddNewOrderButton = UIAction{ [unowned self] _ in
            let addNewOrderViewController = AddNewOrderViewController()
            self.navigationController?.pushViewController(addNewOrderViewController, animated: true)
        }
        contentView.addAnOrderButton.addAction(tapAddNewOrderButton, for: .touchUpInside)
    }
    
    @objc func tapInfoButton() {
            let accountInfoViewController = AccountInfoViewController(newUser: false)
            navigationController?.pushViewController(accountInfoViewController, animated: true)
    }
}

//        var accountInfoViewController: UIViewController?
//        for viewController in (navigationController?.viewControllers ?? []) {
//            if viewController is AccountInfoViewController {
//                accountInfoViewController = viewController
//            }
//        }
//
//        if accountInfoViewController != nil {
//            guard let accountInfoViewController = accountInfoViewController else {return}
//            navigationController?.popToViewController(accountInfoViewController, animated: true)
//        } else {
