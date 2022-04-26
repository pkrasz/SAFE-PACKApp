//
//  AccountInterfaceViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 11/04/2022.
//

import UIKit

final class AccountInterfaceViewController: BaseViewController<AccountInterfaceView> {
    
    //MARK: - Properties
    
    var allOrders: [Order] = [] {
        didSet {
            contentView.activityIndicatorView.isHidden = true
            reloadLocalData()
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FirebaseClient.shared.getAccountInfo(userUID: UserSession.shared.UserInfo(about: User.id)) { [weak self] userInfo in
            self?.contentView.nameLabel.text = userInfo.companyName
        }
        contentView.emailLabel.text = UserSession.shared.UserInfo(about: User.email)
        
        FirebaseClient.shared.getOrders(userID: UserSession.shared.UserInfo(about: User.id)) { [weak self] orders in
            self?.allOrders = orders
        }
    }
    
    //MARK: - Setup
    
    override func setupView() {
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem?.isEnabled = true
        navigationController?.isNavigationBarHidden = false
        navigationItem.rightBarButtonItem = contentView.infoButton
    }
    
    override func setupBindings() {
        contentView.infoButton.target = self
        contentView.infoButton.action = #selector(tapInfoButton)
        
        let tapLogOutButton = UIAction{ [unowned self] _ in
            UserSession.shared.logOut()
            self.navigationController?.popToRootViewController(animated: true)
        }
        contentView.logOutButton.addAction(tapLogOutButton, for: .touchUpInside)
        
        let tapAddNewOrderButton = UIAction{ [unowned self] _ in
            let addNewOrderViewController = AddNewOrderViewController()
            self.navigationController?.pushViewController(addNewOrderViewController, animated: true)
        }
        contentView.addAnOrderButton.addAction(tapAddNewOrderButton, for: .touchUpInside)
        
        let tapYourOrders = UIAction{ [unowned self] _ in
            let ordersViewController = OrdersViewController()
            navigationController?.pushViewController(ordersViewController, animated: true)
        }
        contentView.yourOrdersButton.addAction(tapYourOrders, for: .touchUpInside)
        
    }
    
    //MARK: - Methods
    
    func reloadLocalData() {
        var progressOrdersInt: Int = 0
        var awaitingPaymentOrdersInt: Int = 0
        for order in allOrders {
            switch order.status {
            case Status.inProgress:
                progressOrdersInt += 1
            case Status.awaitingPayment:
                awaitingPaymentOrdersInt += 1
            default:
                Void()
            }
        }
        if awaitingPaymentOrdersInt > 0 {
            contentView.ordersAwaitingPaymentLabel.textColor = Color.red
        } else {
            contentView.ordersAwaitingPaymentLabel.textColor = Color.darkGreen
        }
        let progressOrders: String = String(progressOrdersInt)
        let awaitingPaymentOrders: String = String(awaitingPaymentOrdersInt)
        contentView.ordersAwaitingPaymentLabel.text = awaitingPaymentOrders
        contentView.ordersInProgressLabel.text = progressOrders
    }
    
    @objc func tapInfoButton() {
        let accountInfoViewController = AccountInfoViewController(newUser: false)
        navigationController?.pushViewController(accountInfoViewController, animated: true)
    }
}
