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
        image.layer.cornerRadius = Subview.cornerRadius
        image.layer.borderColor = Color.darkGreen.cgColor
        image.layer.borderWidth = Subview.borderWidth
        return image
    }()
    
    let orderNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.orederNumber
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let orderNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.font
        return label
    }()
    
    let orderAmountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.orderAmount
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let orderAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.font
        return label
    }()
    
    let leadTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.leadTime
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let leadTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.font
        return label
    }()
    
    let deliveryAddressTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.deliveryAddress
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let deliveryAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Subview.numberOfLines
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
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
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
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.font
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Subview.numberOfLines
        return label
    }()
    
    let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.dateBig
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
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
        button.layer.cornerRadius = Subview.cornerRadius
        button.layer.borderWidth = Subview.borderWidth
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
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
            
            infoBackground.topAnchor.constraint(equalTo: topAnchor, constant: OrderView.Background.topSpace),
            infoBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoBackground.widthAnchor.constraint(equalToConstant: OrderView.Background.width),
            infoBackground.heightAnchor.constraint(equalToConstant: OrderView.Background.height),
            
            orderNumberTitleLabel.topAnchor.constraint(equalTo: infoBackground.topAnchor, constant: OrderView.Label.topSpace),
            orderNumberTitleLabel.leadingAnchor.constraint(equalTo: infoBackground.leadingAnchor, constant: OrderView.Label.leadingSpace),
            
            orderNumberLabel.topAnchor.constraint(equalTo: orderNumberTitleLabel.bottomAnchor, constant: OrderView.Label.betweenSpace),
            orderNumberLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            orderNumberLabel.trailingAnchor.constraint(greaterThanOrEqualTo: orderNumberTitleLabel.trailingAnchor),
            
            orderAmountTitleLabel.topAnchor.constraint(equalTo: orderNumberLabel.bottomAnchor, constant: OrderView.Label.betweenTopSpace),
            orderAmountTitleLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            orderAmountTitleLabel.trailingAnchor.constraint(equalTo: orderNumberTitleLabel.trailingAnchor),
            
            orderAmountLabel.topAnchor.constraint(equalTo: orderAmountTitleLabel.bottomAnchor, constant: OrderView.Label.betweenSpace),
            orderAmountLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            orderAmountLabel.trailingAnchor.constraint(greaterThanOrEqualTo: orderAmountTitleLabel.trailingAnchor),
            
            statusTitleLabel.topAnchor.constraint(equalTo: dateTitleLabel.topAnchor),
            statusTitleLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            statusTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: orderNumberTitleLabel.trailingAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: statusTitleLabel.bottomAnchor, constant: OrderView.Label.betweenSpace),
            statusLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.leadingAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: OrderView.Label.statusWidth),
            
            availabilityUIImage.centerYAnchor.constraint(equalTo: statusTitleLabel.centerYAnchor),
            availabilityUIImage.leadingAnchor.constraint(greaterThanOrEqualTo: statusTitleLabel.trailingAnchor),
            availabilityUIImage.trailingAnchor.constraint(equalTo: orderNumberTitleLabel.trailingAnchor),
            
            leadTimeTitleLabel.topAnchor.constraint(equalTo: orderNumberTitleLabel.topAnchor),
            leadTimeTitleLabel.leadingAnchor.constraint(equalTo: orderNumberTitleLabel.trailingAnchor, constant: OrderView.Label.betweenColumnSpace),
            leadTimeTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            leadTimeLabel.topAnchor.constraint(equalTo: leadTimeTitleLabel.bottomAnchor, constant: OrderView.Label.betweenSpace),
            leadTimeLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            leadTimeLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            deliveryAddressTitleLabel.topAnchor.constraint(equalTo: leadTimeLabel.bottomAnchor, constant: OrderView.Label.betweenTopSpace),
            deliveryAddressTitleLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            deliveryAddressTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            deliveryAddressLabel.topAnchor.constraint(equalTo: deliveryAddressTitleLabel.bottomAnchor, constant: OrderView.Label.betweenSpace),
            deliveryAddressLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            deliveryAddressLabel.trailingAnchor.constraint(lessThanOrEqualTo: infoBackground.trailingAnchor, constant: OrderView.Label.leadingSpace),
            
            dateTitleLabel.topAnchor.constraint(equalTo: deliveryAddressLabel.bottomAnchor, constant: OrderView.Label.betweenTopSpace),
            dateTitleLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            dateTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor, constant: OrderView.Label.betweenSpace),
            dateLabel.leadingAnchor.constraint(equalTo: leadTimeTitleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: infoBackground.trailingAnchor, constant: OrderView.Label.leadingSpace),
            
            lineImage.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: OrderView.Line.topSpace),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            orderTableView.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: OrderView.TableView.topSpace),
            orderTableView.leadingAnchor.constraint(equalTo: infoBackground.leadingAnchor, constant: OrderView.TableView.topSpace),
            orderTableView.trailingAnchor.constraint(equalTo: infoBackground.trailingAnchor, constant: OrderView.TableView.bottomSpace),
            orderTableView.bottomAnchor.constraint(equalTo: infoBackground.bottomAnchor, constant: OrderView.TableView.bottomSpace),
            
            showInvoiceButton.topAnchor.constraint(equalTo: infoBackground.bottomAnchor, constant: OrderView.Button.topSpace),
            showInvoiceButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            showInvoiceButton.heightAnchor.constraint(equalToConstant: Button.Size.accountButtonHeight),
            showInvoiceButton.widthAnchor.constraint(equalToConstant: Button.Size.accountButtonWidth),
            showInvoiceButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
        ])
    }
}
