//
//  Orders.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

final class OrdersView: BaseView {

    //MARK: - SubView
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.accountBackgroundTwo
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let allOrdersTittleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.numberOfAllOrders
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let allOrdersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        return label
    }()
    
    let unpaidOrdersTittleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.numberOfUnpaidOrders
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let unpaidOrdersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        return label
    }()
    
    let awaitingTittleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.numberOfAwaitingOrders
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let awaitngLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        return label
    }()
    
    let ordersInProgressTittleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.numberOfOrdersInProgress
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let ordersInProgressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        return label
    }()
    
    let lineImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.line
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let orderTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
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
         allOrdersTittleLabel,
         allOrdersLabel,
         unpaidOrdersTittleLabel,
         unpaidOrdersLabel,
         awaitingTittleLabel,
         awaitngLabel,
         ordersInProgressTittleLabel,
         ordersInProgressLabel,
         lineImage,
         orderTableView,
         activityIndicatorView]
            .forEach(addSubview)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            allOrdersTittleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 126),
            allOrdersTittleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            allOrdersTittleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            allOrdersLabel.topAnchor.constraint(equalTo: allOrdersTittleLabel.bottomAnchor, constant: 1),
            allOrdersLabel.leadingAnchor.constraint(equalTo: allOrdersTittleLabel.leadingAnchor),
            allOrdersLabel.trailingAnchor.constraint(equalTo: allOrdersTittleLabel.trailingAnchor),
            
            unpaidOrdersTittleLabel.topAnchor.constraint(equalTo: allOrdersLabel.bottomAnchor, constant: 10),
            unpaidOrdersTittleLabel.leadingAnchor.constraint(equalTo: allOrdersTittleLabel.leadingAnchor),
            unpaidOrdersTittleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            unpaidOrdersLabel.topAnchor.constraint(equalTo: unpaidOrdersTittleLabel.bottomAnchor, constant: 1),
            unpaidOrdersLabel.leadingAnchor.constraint(equalTo: allOrdersTittleLabel.leadingAnchor),
            unpaidOrdersLabel.trailingAnchor.constraint(equalTo: unpaidOrdersTittleLabel.trailingAnchor),
            
            ordersInProgressTittleLabel.topAnchor.constraint(equalTo: allOrdersTittleLabel.topAnchor),
            ordersInProgressTittleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: allOrdersTittleLabel.trailingAnchor),
            ordersInProgressTittleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            ordersInProgressLabel.topAnchor.constraint(equalTo: ordersInProgressTittleLabel.bottomAnchor, constant: 1),
            ordersInProgressLabel.leadingAnchor.constraint(equalTo: ordersInProgressTittleLabel.leadingAnchor),
            ordersInProgressLabel.trailingAnchor.constraint(equalTo: ordersInProgressTittleLabel.trailingAnchor),
            
            awaitingTittleLabel.topAnchor.constraint(equalTo: ordersInProgressLabel.bottomAnchor, constant: 10),
            awaitingTittleLabel.leadingAnchor.constraint(equalTo: ordersInProgressLabel.leadingAnchor),
            awaitingTittleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            awaitngLabel.topAnchor.constraint(equalTo: awaitingTittleLabel.bottomAnchor, constant: 1),
            awaitngLabel.leadingAnchor.constraint(equalTo: awaitingTittleLabel.leadingAnchor),
            awaitngLabel.trailingAnchor.constraint(equalTo: awaitingTittleLabel.trailingAnchor),
            
            lineImage.topAnchor.constraint(equalTo: awaitngLabel.bottomAnchor, constant: 20),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            orderTableView.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: 20),
            orderTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            orderTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            orderTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -270),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
