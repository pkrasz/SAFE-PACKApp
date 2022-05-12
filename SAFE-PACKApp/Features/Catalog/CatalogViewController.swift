//
//  CatalogViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

final class CatalogViewController: BaseViewController<CatalogView> {
    
    //MARK: - Properties
    
    var products: [Product] = [] {
        didSet {
            downloadImages()
        }
    }
    
    var images: [String: UIImage] = [:] {
        didSet {
            loadingCatalog()
        }
    }
    
    //MARK: - Setup
    
    override func setupView() {
        FirebaseClient.shared.getProducts() { [weak self] productArray in
            self?.products = productArray
        }
        contentView.catalogCollectionView.dataSource = self
        contentView.catalogCollectionView.delegate = self
        contentView.catalogCollectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.identifier)
    }
    
    //MARK: - Methods
    
    func downloadImages() {
        for product in products {
            FirebaseClient.shared.setImage(name: product.name){ [weak self] image in
                guard let image = image else {return}
                self?.images[product.name] = image
            }
        }
    }
    
    func loadingCatalog() {
        if images.count == products.count {
            self.contentView.activityIndicatorView.isHidden = true
            self.contentView.catalogCollectionView.reloadData()
            UIView.animate(withDuration: Animate.time) {
                self.contentView.catalogCollectionView.layoutIfNeeded()
            }
        }
    }
}

    //MARK: - Extensions

extension CatalogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.identifier, for: indexPath) as! CatalogCollectionViewCell
        let product = products[indexPath.item]
        cell.productNameLabel.text = product.name
        cell.sizeOfPackageLabelOne.text = Labels.Text.length + product.length
        cell.sizeOfPackageLabelTwo.text = Labels.Text.width + product.width
        cell.sizeOfPackageLabelThree.text = Labels.Text.height + product.height
        cell.sizesAdaptedLabelOne.text = Labels.Text.inPost + Labels.Text.dash + product.inPost
        cell.sizesAdaptedLabelTwo.text = Labels.Text.dhl + Labels.Text.dash + product.DHL
        cell.sizesAdaptedLabelThree.text = Labels.Text.pocztex + Labels.Text.dash + product.pocztex
        cell.productImageView.image = images[product.name]
        let labels: [UILabel] = [
            cell.recommendedLabelOne,
            cell.recommendedLabelTwo,
            cell.recommendedLabelThree,
            cell.recommendedLabelFour,
            cell.recommendedLabelFive,
            cell.recommendedLabelSix
        ]
        for index in 0 ..< product.recommendation.count {
            labels[index].text = product.recommendation[index]
        }
        return cell
    }
}

extension CatalogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: contentView.catalogCollectionView.frame.width,
            height: contentView.catalogCollectionView.frame.height
        )
    }
}
