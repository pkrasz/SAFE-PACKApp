//
//  AddNewOrderViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

class AddNewOrderViewController: BaseViewController<AddNewOrderView> {
    
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
                self.contentView.productsCollectionView.reloadData()
                UIView.animate(withDuration: 0.4) {
                    self.contentView.productsCollectionView.layoutIfNeeded()
                }
            }
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contentView.productsCollectionView.reloadData()
    }
    
    //MARK: - Setup
    
    override func setupView() {
        FirebaseClient.shared.getProducts() { [unowned self] productArray in
            self.products = productArray
        }
        
        contentView.productsCollectionView.delegate = self
        contentView.productsCollectionView.dataSource = self
        contentView.productsCollectionView.register(AddNewOrderCollectionViewCell.self, forCellWithReuseIdentifier: AddNewOrderCollectionViewCell.identifier)
        
        navigationItem.rightBarButtonItem = contentView.goToBasketButton
    }
    
    
    override func setupBindings() {
        
        contentView.goToBasketButton.target = self
        contentView.goToBasketButton.action = #selector(tapGoToBasketButton)
    }
    
    @objc func tapGoToBasketButton() {
        let basketViewController = BasketViewController()
        navigationController?.pushViewController(basketViewController, animated: true)
    }
}

//MARK: - Extension

extension AddNewOrderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddNewOrderCollectionViewCell.identifier, for: indexPath) as! AddNewOrderCollectionViewCell
        
        cell.delegateaddToBasketButton = self
        cell.product = products[indexPath.item]
        let product = products[indexPath.item]
        
        cell.productNameLabel.text = product.name
        cell.lengthLabel.text = "L: \(product.length)"
        cell.widthLabel.text = "W: \(product.width)"
        cell.heightLabel.text = "H: \(product.height)"
        cell.productImageView.image = images[indexPath.item]
        let price: String = String(product.price)
        cell.priceLabel.text = price + Labels.Text.pln
        return cell
    }
    
    
}

extension AddNewOrderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 140)
    }
    
}

extension AddNewOrderViewController: AddToBasketButton {
    func addToBasketButton(amount: Int, an product: Product) {
        Basket.shared.addToBasket(amount, of: product)
        
    }
}