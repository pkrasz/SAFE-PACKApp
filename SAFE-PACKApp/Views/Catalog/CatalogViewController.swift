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
            for product in products {
                DispatchQueue.main.async {
                    FirebaseClient.shared.setImage(name: product.name){ [weak self] image in
                        guard let image = image else {return}
                        self?.images.append(image)
                    }
                    
                }
                
            }
        }
    }
    
    var images: [UIImage] = [] {
        didSet {
            if images.count == products.count {
                self.contentView.activityIndicatorView.isHidden = true
                self.contentView.catalogCollectionView.reloadData()
                UIView.animate(withDuration: 0.4) {
                    self.contentView.catalogCollectionView.layoutIfNeeded()
                }
            }
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = Color.white
        self.hideKeyboardWhenTappedAround()
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
        cell.sizeOfPackageLabelOne.text = "Length: \(product.length)"
        cell.sizeOfPackageLabelTwo.text = "Width: \(product.width)"
        cell.sizeOfPackageLabelThree.text = "Height: \(product.height)"
        cell.sizesAdaptedLabelOne.text = "InPost - \(product.inPost)"
        cell.sizesAdaptedLabelTwo.text = "DHL - \(product.DHL)"
        cell.sizesAdaptedLabelThree.text = "Pocztex - \(product.pocztex)"
        cell.productImageView.image = images[indexPath.item]
        let labels: [UILabel] = [cell.recommendedLabelOne,
                                 cell.recommendedLabelTwo,
                                 cell.recommendedLabelThree,
                                 cell.recommendedLabelFour,
                                 cell.recommendedLabelFive,
                                 cell.recommendedLabelSix]
        for index in 0 ..< product.recommendation.count {
            labels[index].text = product.recommendation[index]
        }
        return cell
    }
}

extension CatalogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.catalogCollectionView.frame.width, height: contentView.catalogCollectionView.frame.height)
    }
}
