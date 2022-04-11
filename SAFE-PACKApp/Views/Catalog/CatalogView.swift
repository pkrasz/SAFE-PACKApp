//
//  CatalogView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

final class CatalogView: BaseView {
    
    //MARK: - SubView
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.backgroundAccountViews
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = .white
    }
    
    override func setupSubviews() {
        addSubview(backgroundImageView)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}

