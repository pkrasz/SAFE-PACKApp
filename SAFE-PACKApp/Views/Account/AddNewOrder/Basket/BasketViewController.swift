//
//  BasketViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

class BasketViewController: BaseViewController<BasketView> {
    
    //MARK: - Properties
    
    var order: Order?
    var successful: Bool? {
        didSet {
            contentView.activityIndicatorView.isHidden = true
            guard let successful = successful else {return}
            
            if successful == true {
                showAlert(title: "Order placed!", message: "Your order has been registered, you can view it in [Your orders] ", actions: [UIAlertAction(title: "Closed", style: .default, handler: { (action) in
                    for viewController in (self.navigationController?.viewControllers ?? []) {
                        if viewController is AccountInterfaceViewController {
                            self.navigationController?.popToViewController(viewController, animated: true)
                        }
                    }
                } ) ] )
            } else {
                showAlert(title: "Error!", message: "There is an error, please check your internet connection and try again later.", actions: [UIAlertAction(title: "Closed", style: .default, handler: { (action) in
                    for viewController in (self.navigationController?.viewControllers ?? []) {
                        if viewController is AccountInterfaceViewController {
                            self.navigationController?.popToViewController(viewController, animated: true)
                        }
                    }
                } ) ] )
            }
            
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let orderAmount = String(Basket.shared.basketValue)
        contentView.orderAmountLabel.text = orderAmount + Labels.Text.pln
        contentView.leadTimeLabel.text = Basket.shared.leadTime
        contentView.deliveryAddressLabel.text = Basket.shared.deliveryAddress
        contentView.orderTableView.reloadData()
    }
    
    //MARK: - Setup
    
    override func setupView() {
        
        contentView.orderTableView.dataSource = self
        contentView.orderTableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifire.tableView)
        
    }
    override func setupBindings() {
        let tapCompleteButton = UIAction{ [unowned self] _ in
            self.contentView.activityIndicatorView.isHidden = false
            Basket.shared.completeOrder() { [unowned self] newOrder in
                self.order = newOrder
            }
            
            guard let order = order else {return}
            FirebaseClient.shared.addOrder(userUID: UserSession.shared.UserInfo(about: User.id), with: order) { [weak self] success in
                self?.successful = success
            }
        }
        contentView.completeOrderButton.addAction(tapCompleteButton, for: .touchUpInside)
    }
}


extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Basket.shared.productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifire.tableView, for: indexPath)
        let basketProduct = Basket.shared.productsList[indexPath.row]
        let product = basketProduct.product
        let totalPtice = String(basketProduct.totalPrice)
        
        let name = "Box - \(product.name) / "
        let amount = "amount: \(basketProduct.amount) / "
        let price = Labels.Text.price + totalPtice + Labels.Text.pln
        cell.textLabel?.font = .systemFont(ofSize: 11)
        cell.textLabel?.text = name + amount + price
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
}

extension BasketViewController {
    
    enum Identifire {
        static let tableView: String = "UITableViewCell"
    }
}
