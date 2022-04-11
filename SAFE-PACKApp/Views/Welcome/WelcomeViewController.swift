//
//  ViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 05/04/2022.
//

import UIKit

final class WelcomeViewController: BaseViewController<WelcomeView> {
    
    //MARK: - Setup
    
    override func setupView() {
//        FirebaseClient.shared.signIn(email: "dupa@fdupa2.pl", password: "test3245")
//        FirebaseClient.shared.createOrder(with: "DUpa Blada2")
//        FirebaseClient.shared.allOrders { _ in }
//        FirebaseClient.shared.addNewPackage()
//        FirebaseClient.shared.addNewPackage()
//        FirebaseClient.shared.addNewPackage()

        navigationController?.isNavigationBarHidden = true
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.contentView.logoAnimation()
        }
    }
    
    override func setupBindings() {
        
        let tapLoginButton = UIAction{ [unowned self] _ in
            
            let loginViewController = LoginViewController()
            self.navigationController?.pushViewController(loginViewController, animated: true)
        }
        contentView.loginButton.addAction(tapLoginButton, for: .touchUpInside)
        
        let tapProductButton = UIAction{ [unowned self] _ in
            
            let catalogViewController = CatalogViewController()
            self.navigationController?.pushViewController(catalogViewController, animated: true)
        }
        contentView.catalogButton.addAction(tapProductButton, for: .touchUpInside)
    }
}


