//
//  AccountInterfaceView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 11/04/2022.
//

import UIKit

final class AccountInterfaceView: BaseView {
    
    //MARK: - Subview
    
    let background: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.accountInterfaceBackground
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.name
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelFont)
        label.textColor = Color.font
        return label
    }()
    
    let emailTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.email
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let emailLabel: UILabel = {
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
    
    let ordersAwaitingPaymentTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.ordersAwaitingPayment
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let ordersAwaitingPaymentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let ordersInProgressTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.ordersInProgress
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let ordersInProgressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.darkGreen
        return label
    }()
    
    
    let lineSecondImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.line
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let addAnOrderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.setTitle(Buttons.Title.addAnOrder, for: .normal)
        button.setTitleColor(Color.font, for: .normal)
        return button
    }()
    
    let yourOrdersButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.setTitle(Buttons.Title.yourOrders, for: .normal)
        button.setTitleColor(Color.font, for: .normal)
        return button
    }()
    
    let logOutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Color.red.cgColor
        button.backgroundColor = .white
        button.setTitle(Buttons.Title.logOut, for: .normal)
        button.setTitleColor(Color.red, for: .normal)
        return button
    }()
    
    let infoButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "info.circle")
        button.tintColor = .white
        return button
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = Color.font
        return activityIndicator
    }()
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = Color.white
    }
    
    override func setupSubviews() {
        [background,
         nameTitleLabel,
         nameLabel,
         emailTitleLabel,
         emailLabel,
         lineImage,
         ordersAwaitingPaymentTitleLabel,
         ordersAwaitingPaymentLabel,
         ordersInProgressTitleLabel,
         ordersInProgressLabel,
         lineSecondImage,
         addAnOrderButton,
         yourOrdersButton,
         logOutButton,
         activityIndicatorView]
            .forEach(addSubview)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            nameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 127),
            nameTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            
            nameLabel.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: nameTitleLabel.trailingAnchor),
            
            emailTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: 5),
            emailLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(lessThanOrEqualTo: emailTitleLabel.trailingAnchor),
            
            lineImage.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            ordersAwaitingPaymentTitleLabel.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: 20),
            ordersAwaitingPaymentTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            
            ordersAwaitingPaymentLabel.topAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.topAnchor),
            ordersAwaitingPaymentLabel.leadingAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.trailingAnchor, constant: 5),
            ordersAwaitingPaymentLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            ordersAwaitingPaymentLabel.bottomAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.bottomAnchor),
            
            ordersInProgressTitleLabel.topAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.bottomAnchor, constant: 10),
            ordersInProgressTitleLabel.leadingAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.leadingAnchor),
            
            ordersInProgressLabel.topAnchor.constraint(equalTo: ordersInProgressTitleLabel.topAnchor),
            ordersInProgressLabel.leadingAnchor.constraint(equalTo: ordersInProgressTitleLabel.trailingAnchor, constant: 5),
            ordersInProgressLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            ordersInProgressLabel.bottomAnchor.constraint(equalTo: ordersInProgressTitleLabel.bottomAnchor),
            
            lineSecondImage.topAnchor.constraint(equalTo: ordersInProgressTitleLabel.bottomAnchor, constant: 20),
            lineSecondImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            addAnOrderButton.topAnchor.constraint(equalTo: lineSecondImage.bottomAnchor, constant: 20),
            addAnOrderButton.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            addAnOrderButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -5),
            addAnOrderButton.heightAnchor.constraint(equalToConstant: Buttons.Size.accountButtonHeight),
            addAnOrderButton.widthAnchor.constraint(equalToConstant: Buttons.Size.accountButtonWidth),
            
            yourOrdersButton.topAnchor.constraint(equalTo: addAnOrderButton.topAnchor),
            yourOrdersButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 5),
            yourOrdersButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            yourOrdersButton.heightAnchor.constraint(equalToConstant: Buttons.Size.accountButtonHeight),
            yourOrdersButton.widthAnchor.constraint(equalToConstant: Buttons.Size.accountButtonWidth),
            
            logOutButton.topAnchor.constraint(equalTo: addAnOrderButton.bottomAnchor, constant: 10),
            logOutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: Buttons.Size.accountButtonHeight),
            logOutButton.widthAnchor.constraint(equalToConstant: Buttons.Size.accountButtonWidth),
            logOutButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
