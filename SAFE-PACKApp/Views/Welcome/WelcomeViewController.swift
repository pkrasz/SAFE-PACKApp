//
//  ViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 05/04/2022.
//

import UIKit

final class WelcomeViewController: BaseViewController<WelcomeView> {
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let loginStatus = UserSession.shared.loginStatus()
        if loginStatus == true {
            navigationController?.pushViewController(AccountInterfaceViewController(), animated: false)
        }
    }
    
    //MARK: - Setup
    
    override func setupView() {
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


