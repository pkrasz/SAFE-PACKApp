//
//  BasketViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

final class BasketViewController: BaseViewController<BasketView> {
    
    //MARK: - Properties
    
    var order: Order?
    var successful: Bool? {
        didSet {
            contentView.activityIndicatorView.isHidden = true
            guard let successful = successful else {return}
            
            if successful == true {
                showAlert(title: Alert.Title.orderPlaced, message: Alert.Messege.orderPlaced, actions: [UIAlertAction(title: Alert.ActionTitle.close, style: .default, handler: { (action) in
                    self.order = nil
                    self.successful = nil
                    for viewController in (self.navigationController?.viewControllers ?? []) {
                        
                        if viewController is AccountInterfaceViewController {
                            self.navigationController?.popToViewController(viewController, animated: true)
                        }
                    }
                } ) ] )
            } else {
                showAlert(title: Alert.Title.error, message: Alert.Messege.orderError, actions: [UIAlertAction(title: Alert.ActionTitle.close, style: .default, handler: { (action) in
                    self.order = nil
                    self.successful = nil
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
        
        reloadLocalData()
    }
    
    //MARK: - Setup
    
    func reloadLocalData() {
        let orderAmountFloat = Float(Basket.shared.basketValue)
        let orderAmount = String(orderAmountFloat)
        
        contentView.deliveryAddressLabel.text = Basket.shared.deliveryAddress
        contentView.orderNumberLabel.text = Basket.shared.orderNumber
        contentView.orderAmountLabel.text = orderAmount + Labels.Text.pln
        contentView.leadTimeLabel.text = Basket.shared.leadTime
        contentView.orderTableView.reloadData()
    }
    
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

            let userID: String = UserSession.shared.UserInfo(about: User.id)
            var userName: String = Empty.string {
                didSet {
                    FirebaseClient.shared.addInvoiceFolders(userName: userName, userID: userID, orderNumber: order.orderNumber)
                }
            }
            FirebaseClient.shared.getAccountInfo(userUID: userID) { userInfo in
                userName = userInfo.companyName
            }
            FirebaseClient.shared.addOrder(userUID: userID, with: order) { [weak self] success in
                self?.successful = success
            }
        }
        contentView.completeOrderButton.addAction(tapCompleteButton, for: .touchUpInside)
    }
}

//MARK: - Extension

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Basket.shared.productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifire.tableView, for: indexPath)
        let basketProduct = Basket.shared.productsList[indexPath.row]
        let product = basketProduct.product
        let totalPticeFloat = Float(basketProduct.totalPrice)
        let totalPtice = String(totalPticeFloat)
        
        
        let name = Labels.Text.box + product.name
        let amountString = String(basketProduct.amount)
        let amount = Labels.Text.amount + amountString
        let price = Labels.Text.price + totalPtice + Labels.Text.pln
        cell.textLabel?.font = .systemFont(ofSize: 11)
        cell.textLabel?.text = name + Labels.Text.slash + amount + Labels.Text.slash + price
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let basketProduct = Basket.shared.productsList[indexPath.row]
            Basket.shared.removeFromBasket(product: basketProduct)
            reloadLocalData()
        }
    }
}
