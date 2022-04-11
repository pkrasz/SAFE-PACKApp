//
//  CatalogViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

final class CatalogViewController: BaseViewController<CatalogView> {
    
    //MARK: - Properties
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = Color.white
    }
   
    //MARK: - Setup
    
    override func setupView() {
       
    }
    
    override func setupBindings() {
        
    }
}

