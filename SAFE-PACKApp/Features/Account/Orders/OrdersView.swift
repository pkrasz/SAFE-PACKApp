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
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let allOrdersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.font
        return label
    }()
    
    let unpaidOrdersTittleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.numberOfUnpaidOrders
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let unpaidOrdersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.font
        return label
    }()
    
    let awaitingTittleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.numberOfAwaitingOrders
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let awaitngLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.font
        return label
    }()
    
    let ordersInProgressTittleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.numberOfOrdersInProgress
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let ordersInProgressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
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
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
            
            allOrdersTittleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Label.allOrdersTop),
            allOrdersTittleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leading),
            allOrdersTittleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            allOrdersLabel.topAnchor.constraint(equalTo: allOrdersTittleLabel.bottomAnchor, constant: Constants.Label.betweenSpace),
            allOrdersLabel.leadingAnchor.constraint(equalTo: allOrdersTittleLabel.leadingAnchor),
            allOrdersLabel.trailingAnchor.constraint(equalTo: allOrdersTittleLabel.trailingAnchor),
            
            unpaidOrdersTittleLabel.topAnchor.constraint(equalTo: allOrdersLabel.bottomAnchor, constant: Constants.Label.topSpace),
            unpaidOrdersTittleLabel.leadingAnchor.constraint(equalTo: allOrdersTittleLabel.leadingAnchor),
            unpaidOrdersTittleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            unpaidOrdersLabel.topAnchor.constraint(equalTo: unpaidOrdersTittleLabel.bottomAnchor, constant: Constants.Label.betweenSpace),
            unpaidOrdersLabel.leadingAnchor.constraint(equalTo: allOrdersTittleLabel.leadingAnchor),
            unpaidOrdersLabel.trailingAnchor.constraint(equalTo: unpaidOrdersTittleLabel.trailingAnchor),
            
            ordersInProgressTittleLabel.topAnchor.constraint(equalTo: allOrdersTittleLabel.topAnchor),
            ordersInProgressTittleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: allOrdersTittleLabel.trailingAnchor),
            ordersInProgressTittleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.trailing),
            
            ordersInProgressLabel.topAnchor.constraint(equalTo: ordersInProgressTittleLabel.bottomAnchor, constant: Constants.Label.betweenSpace),
            ordersInProgressLabel.leadingAnchor.constraint(equalTo: ordersInProgressTittleLabel.leadingAnchor),
            ordersInProgressLabel.trailingAnchor.constraint(equalTo: ordersInProgressTittleLabel.trailingAnchor),
            
            awaitingTittleLabel.topAnchor.constraint(equalTo: ordersInProgressLabel.bottomAnchor, constant: Constants.Label.topSpace),
            awaitingTittleLabel.leadingAnchor.constraint(equalTo: ordersInProgressLabel.leadingAnchor),
            awaitingTittleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            awaitngLabel.topAnchor.constraint(equalTo: awaitingTittleLabel.bottomAnchor, constant: Constants.Label.betweenSpace),
            awaitngLabel.leadingAnchor.constraint(equalTo: awaitingTittleLabel.leadingAnchor),
            awaitngLabel.trailingAnchor.constraint(equalTo: awaitingTittleLabel.trailingAnchor),
            
            lineImage.topAnchor.constraint(equalTo: awaitngLabel.bottomAnchor, constant: Constants.Line.topSpace),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            orderTableView.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: Constants.Line.topSpace),
            orderTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leading),
            orderTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.trailing),
            orderTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.bottom),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

    //MARK: - Extensions

extension OrdersView {
    enum Constants {
        static let bottom: CGFloat = -270
            static let leading: CGFloat = 30
            static let trailing: CGFloat = -30
        
        enum Label {
            static let allOrdersTop: CGFloat = 127
            static let topSpace: CGFloat = 10
            static let betweenSpace: CGFloat = 1
        }
        
        enum Line {
            static let topSpace: CGFloat = 20
        }
    }
}
