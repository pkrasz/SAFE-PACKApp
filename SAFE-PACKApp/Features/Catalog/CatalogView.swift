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
        image.image = Image.catalogBackground
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let catalogCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Subview.minimumLineSpacing
        layout.minimumInteritemSpacing = Subview.minimumInteritemSpacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    let catalogFooterImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.catalogFooter
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = Color.font
        return activityIndicator
    }()
    
    //MARK: - Setup
    
    override func setupSubviews() {
       [backgroundImageView,
        catalogCollectionView,
        catalogFooterImageView,
       activityIndicatorView]
            .forEach(addSubview)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
            
            catalogCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.collectionTop),
            catalogCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            catalogCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            catalogCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            catalogFooterImageView.topAnchor.constraint(lessThanOrEqualTo: topAnchor),
            catalogFooterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            catalogFooterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            catalogFooterImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

    //MARK: - Extensions

extension CatalogView {
    enum Constants {
        static let collectionTop: CGFloat = 106
    }
}

