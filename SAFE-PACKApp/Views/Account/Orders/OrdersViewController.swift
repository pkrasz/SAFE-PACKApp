//
//  OrdersViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

final class OrdersViewController: BaseViewController<OrdersView> {
    
    //MARK: - Properties
    
    var allOrders: [Order] = [] {
        didSet {
            contentView.activityIndicatorView.isHidden = true
            reloadLocalData()
        }
    }
    
    //MARK: - Setup
    
    override func setupView() {
        FirebaseClient.shared.getOrders(userID: UserSession.shared.UserInfo(about: User.id)) { [weak self] orders in
            self?.allOrders = orders
        }
        
        contentView.orderTableView.dataSource = self
        contentView.orderTableView.delegate = self
        contentView.orderTableView.register(OrdersTableViewCell.self, forCellReuseIdentifier: OrdersTableViewCell.identifier)
    }
    
    //MARK: - Methods
    
    func reloadLocalData() {
        var awaitingOrdersInt: Int = 0
        var progressOrdersInt: Int = 0
        var unpaidOrdersInt: Int = 0
        for order in allOrders {
            switch order.status {
            case Status.awaitingPayment:
                awaitingOrdersInt += 1
            case Status.inProgress:
                progressOrdersInt += 1
            case Status.unpaid:
                unpaidOrdersInt += 1
            default:
                Void()
            }
        }
        if unpaidOrdersInt > 0 {
            contentView.unpaidOrdersLabel.textColor = Color.red
        } else {
            contentView.unpaidOrdersLabel.textColor = Color.font
        }
        let allOrdersCount: String = String(allOrders.count)
        let awaitingOrders: String = String(awaitingOrdersInt)
        let progressOrders: String = String(progressOrdersInt)
        let unpaidOrders: String = String(unpaidOrdersInt)
        contentView.allOrdersLabel.text = allOrdersCount
        contentView.unpaidOrdersLabel.text = unpaidOrders
        contentView.ordersInProgressLabel.text = progressOrders
        contentView.awaitngLabel.text = awaitingOrders
        contentView.orderTableView.reloadData()
    }
}

    //MARK: - Extension

extension OrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrdersTableViewCell.identifier, for: indexPath) as! OrdersTableViewCell
        let revIndexPath: Int = allOrders.count - indexPath.row - 1
        let order = allOrders[revIndexPath]
        cell.selectionStyle = .none
        cell.orderNumberLabel.text = order.orderNumber
        cell.dateLabel.text = order.dateOfTheOrder
        
        switch order.status {
        case Status.awaitingPayment:
            cell.availabilityUIImage.tintColor = Color.yellow
        case Status.inProgress:
            cell.availabilityUIImage.tintColor = Color.lightGreen
        case Status.realized:
            cell.availabilityUIImage.tintColor = Color.darkGreen
        case Status.unpaid:
            cell.availabilityUIImage.tintColor = Color.red
        default:
            Void()
        }
        return cell
    }
}

extension OrdersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revIndexPath: Int = allOrders.count - indexPath.row - 1
        let order = allOrders[revIndexPath]
        let singleOrderViewController = SingleOrderViewController(selectedOrder: order)
        navigationController?.pushViewController(singleOrderViewController, animated: true)
    }
}

