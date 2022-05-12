//
//  SingleOrderViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

final class SingleOrderViewController: BaseViewController<SingleOrderView> {
    
    //MARK: - Properties
    
    let order: Order
    
    //MARK: - Initializator
    
    init(selectedOrder: Order) {
        self.order = selectedOrder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    override func setupView() {
        contentView.orderTableView.dataSource = self
        contentView.orderTableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifire.tableView)
        
        let orderAmountFloat: Float = Float(order.orderPrice)
        let orderAmount: String = String(orderAmountFloat)
        
        contentView.orderNumberLabel.text = order.orderNumber
        contentView.orderAmountLabel.text = orderAmount + Labels.Text.pln
        contentView.leadTimeLabel.text = order.leadTime
        contentView.deliveryAddressLabel.text = order.deliveryAddress
        contentView.dateLabel.text = order.dateOfTheOrder
        
        switch order.status {
        case StatusInt.awaitingAccepted:
            contentView.statusLabel.text = Status.awaitingAccepted
        case StatusInt.awaitingPayment:
            contentView.statusLabel.text = Status.awaitingPayment
            contentView.availabilityUIImage.tintColor = Color.yellow
            contentView.showInvoiceButton.isHidden = false
            contentView.showInvoiceButton.setTitle(Button.Title.proforma, for: .normal)
        case StatusInt.inProgress:
            contentView.statusLabel.text = Status.inProgress
            contentView.availabilityUIImage.tintColor = Color.lightGreen
            contentView.showInvoiceButton.isHidden = false
            contentView.showInvoiceButton.setTitle(Button.Title.invoice, for: .normal)
        case StatusInt.realized:
            contentView.statusLabel.text = Status.realized
            contentView.availabilityUIImage.tintColor = Color.darkGreen
            contentView.showInvoiceButton.isHidden = false
            contentView.showInvoiceButton.setTitle(Button.Title.invoice, for: .normal)
        case StatusInt.unpaid:
            contentView.statusLabel.text = Status.unpaid
            contentView.availabilityUIImage.tintColor = Color.red
            contentView.showInvoiceButton.isHidden = false
            contentView.showInvoiceButton.setTitle(Button.Title.invoice, for: .normal)
        default:
            Void()
        }
    }
    
    override func setupBindings() {
        let tapShowInvoiceButton = UIAction { [unowned self] _ in
            let invoiceViewController = InvoiceViewController(selectedOrder: order)
            navigationController?.pushViewController(invoiceViewController, animated: true)
        }
        contentView.showInvoiceButton.addAction(tapShowInvoiceButton, for: .touchUpInside)
    }
}

    //MARK: - Extensions

extension SingleOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifire.tableView, for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.textLabel?.font = .systemFont(ofSize: Labels.FontSize.tableView)
        let basketProduct = order.productsList[indexPath.row]
        let product = basketProduct.product
        
        let totalPriceFloat = Float(basketProduct.totalPrice)
        let totalPrice = String(totalPriceFloat)
        let amountString = String(basketProduct.amount)
        let name = Labels.Text.box + product.name
        let amount = Labels.Text.amount + amountString
        let price = Labels.Text.price + totalPrice + Labels.Text.pln
        cell.textLabel?.text = name + Labels.Text.slash + amount + Labels.Text.slash + price
        cell.textLabel?.textColor = Color.font
        return cell
    }
}
