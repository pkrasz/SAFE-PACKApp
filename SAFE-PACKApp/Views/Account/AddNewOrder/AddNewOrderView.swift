//
//  AddNewOrderView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

final class AddNewOrderView: BaseView {

    //MARK: - SubView
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.accountBackgroundTwo
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.sectionInset.left = 17
        layout.sectionInset.right = 17
        layout.collectionView?.center = CGPoint.zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = Color.font
        return activityIndicator
    }()
    
    let goToBasketButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "cart")
        button.tintColor = .white
        return button
    }()
    
    //MARK: - Setup
    
    override func setupSubviews() {
        [backgroundImageView,
        productsCollectionView,
         activityIndicatorView]
            .forEach(addSubview)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
       
        productsCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 126),
        productsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        productsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        productsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -380),
        
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
