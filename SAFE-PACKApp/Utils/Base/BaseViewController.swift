//
//  UIViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 05/04/2022.
//

import UIKit

class BaseViewController<View: BaseView>: UIViewController {
    
    //MARK: - Properties
    
    var contentView: View {
        return view as! View
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = View()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = Color.white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        setupView()
        setupBindings()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Setup
    
    func setupView() {}
    func setupBindings() {}
    
    //MARK: Methods
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

