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
        
        setupView()
        setupBindings()
    }
    
    // MARK: - Setup
    
    func setupView() {}
    func setupBindings() {}
}
