//
//  SingleOrderView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

final class SingleOrderView: BaseView {
    
    //MARK: - SubView
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.accountBackgroundTwo
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let infoBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Color.white
        image.layer.cornerRadius = 10
        image.layer.borderColor = Color.darkGreen.cgColor
        image.layer.borderWidth = 1
        return image
    }()
    
    let orderNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.orederNumber
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let orderNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        return label
    }()
    
    let orderAmountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.orderAmount
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let orderAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        return label
    }()
    
    let leadTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.leadTime
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let leadTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        return label
    }()
    
    let deliveryAddressTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.deliveryAddress
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let deliveryAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let lineImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.line
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let statusTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.status
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let availabilityUIImage: UIImageView = {
        let image = UIImageView(image: Image.availability)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = Color.fontShadow
        return image
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.dateBig
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        return label
    }()
    
    let orderTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    let showInvoiceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.isHidden = true
        button.setTitleColor(Color.font, for: .normal)
        return button
    }()
    
    //MARK: - Setup
    
    override func setupSubviews() {
        [backgroundImageView,
         infoBackground,
         orderNumberTitleLabel,
         orderNumberLabel,
         orderAmountTitleLabel,
         orderAmountLabel,
         leadTimeTitleLabel,
         leadTimeLabel,
         deliveryAddressTitleLabel,
         deliveryAddressLabel,
         lineImage,
         statusTitleLabel,
         availabilityUIImage,
         statusLabel,
         dateTitleLabel,
         dateLabel,
         orderTableView,
         showInvoiceButton]
            .forEach(addSubview)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            infoBackground.topAnchor.constraint(equalTo: topAnchor, constant: 140),
            infoBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoBackground.widthAnchor.constraint(equalToConstant: 325),
            infoBackground.heightAnchor.constraint(equalToConstant: 365),
            
            orderNumberTitleLabel.topAnchor.constraint(equalTo: infoBackground.topAnchor, constant: 20),
            orderNumberTitleLabel.leadingAnchor.constraint(equalTo: infoBackground.leadingAnchor, constant: 20),
            
            orderNumberLabel.topAnchor.constraint(equalTo: orderNumberTitleLabel.bottomAnchor, constant: 1),
            orderNumberLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            orderNumberLabel.trailingAnchor.constraint(greaterThanOrEqualTo: orderNumberTitleLabel.trailingAnchor),
            
            orderAmountTitleLabel.topAnchor.constraint(equalTo: orderNumberLabel.bottomAnchor, constant: 10),
            orderAmountTitleLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            orderAmountTitleLabel.trailingAnchor.constraint(equalTo: orderNumberTitleLabel.trailingAnchor),
            
            orderAmountLabel.topAnchor.constraint(equalTo: orderAmountTitleLabel.bottomAnchor, constant: 1),
            orderAmountLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            orderAmountLabel.trailingAnchor.constraint(greaterThanOrEqualTo: orderAmountTitleLabel.trailingAnchor),
            
            statusTitleLabel.topAnchor.constraint(equalTo: dateTitleLabel.topAnchor),
            statusTitleLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            statusTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: orderNumberTitleLabel.trailingAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: statusTitleLabel.bottomAnchor, constant: 1),
            statusLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: 110),
            
            availabilityUIImage.centerYAnchor.constraint(equalTo: statusTitleLabel.centerYAnchor),
            availabilityUIImage.leadingAnchor.constraint(greaterThanOrEqualTo: statusTitleLabel.trailingAnchor),
            availabilityUIImage.trailingAnchor.constraint(equalTo: orderNumberTitleLabel.trailingAnchor),
            
            leadTimeTitleLabel.topAnchor.constraint(equalTo: orderNumberTitleLabel.topAnchor),
            leadTimeTitleLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.trailingAnchor, constant: 45),
            leadTimeTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            leadTimeLabel.topAnchor.constraint(equalTo: leadTimeTitleLabel.bottomAnchor, constant: 1),
            leadTimeLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            leadTimeLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            deliveryAddressTitleLabel.topAnchor.constraint(equalTo: leadTimeLabel.bottomAnchor, constant: 10),
            deliveryAddressTitleLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            deliveryAddressTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            deliveryAddressLabel.topAnchor.constraint(equalTo: deliveryAddressTitleLabel.bottomAnchor, constant: 1),
            deliveryAddressLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            deliveryAddressLabel.trailingAnchor.constraint(lessThanOrEqualTo: infoBackground.trailingAnchor, constant: 20),
            
            dateTitleLabel.topAnchor.constraint(equalTo: deliveryAddressLabel.bottomAnchor, constant: 10),
            dateTitleLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            dateTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor, constant: 1),
            dateLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: infoBackground.trailingAnchor, constant: 20),
            
            lineImage.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            orderTableView.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: 10),
            orderTableView.leadingAnchor.constraint(equalTo: infoBackground.leadingAnchor, constant: 10),
            orderTableView.trailingAnchor.constraint(equalTo: infoBackground.trailingAnchor, constant: -10),
            orderTableView.bottomAnchor.constraint(equalTo: infoBackground.bottomAnchor, constant: -10),
            
            showInvoiceButton.topAnchor.constraint(equalTo: infoBackground.bottomAnchor, constant: 25),
            showInvoiceButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            showInvoiceButton.heightAnchor.constraint(equalToConstant: Buttons.Size.accountButtonHeight),
            showInvoiceButton.widthAnchor.constraint(equalToConstant: Buttons.Size.accountButtonWidth),
            showInvoiceButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
        ])
    }
}

