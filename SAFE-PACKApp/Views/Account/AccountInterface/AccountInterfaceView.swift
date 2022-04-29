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
        image.image = Image.accountBackgroundOne
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.name
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.font
        return label
    }()
    
    let emailTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.email
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let emailLabel: UILabel = {
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
    
    let ordersAwaitingPaymentTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.ordersAwaitingPayment
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let ordersAwaitingPaymentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let ordersInProgressTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.ordersInProgress
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let ordersInProgressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.labelTitle)
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
        button.layer.cornerRadius = Subview.cornerRadius
        button.layer.borderWidth = Subview.borderWidth
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.setTitle(Button.Title.addAnOrder, for: .normal)
        button.setTitleColor(Color.font, for: .normal)
        return button
    }()
    
    let yourOrdersButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Subview.cornerRadius
        button.layer.borderWidth = Subview.borderWidth
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.setTitle(Button.Title.yourOrders, for: .normal)
        button.setTitleColor(Color.font, for: .normal)
        return button
    }()
    
    let logOutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Subview.cornerRadius
        button.layer.borderWidth = Subview.borderWidth
        button.layer.borderColor = Color.red.cgColor
        button.backgroundColor = .white
        button.setTitle(Button.Title.logOut, for: .normal)
        button.setTitleColor(Color.red, for: .normal)
        return button
    }()
    
    let infoButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = Image.info
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
            
            nameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: AccountInterfaceConstraints.Label.firstTitleTop),
            nameTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AccountInterfaceConstraints.Label.titleLeading),
            
            nameLabel.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: AccountInterfaceConstraints.Label.between),
            nameLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: nameTitleLabel.trailingAnchor),
            
            emailTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: AccountInterfaceConstraints.Label.secondTitleTop),
            emailTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: AccountInterfaceConstraints.Label.between),
            emailLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(lessThanOrEqualTo: emailTitleLabel.trailingAnchor),
            
            lineImage.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: AccountInterfaceConstraints.Line.topSpace),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            ordersAwaitingPaymentTitleLabel.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: AccountInterfaceConstraints.Line.topSpace),
            ordersAwaitingPaymentTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            
            ordersAwaitingPaymentLabel.topAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.topAnchor),
            ordersAwaitingPaymentLabel.leadingAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.trailingAnchor, constant: AccountInterfaceConstraints.Label.between),
            ordersAwaitingPaymentLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            ordersAwaitingPaymentLabel.bottomAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.bottomAnchor),
            
            ordersInProgressTitleLabel.topAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.bottomAnchor, constant: AccountInterfaceConstraints.Label.secondTitleTop),
            ordersInProgressTitleLabel.leadingAnchor.constraint(equalTo: ordersAwaitingPaymentTitleLabel.leadingAnchor),
            
            ordersInProgressLabel.topAnchor.constraint(equalTo: ordersInProgressTitleLabel.topAnchor),
            ordersInProgressLabel.leadingAnchor.constraint(equalTo: ordersInProgressTitleLabel.trailingAnchor, constant: AccountInterfaceConstraints.Label.between),
            ordersInProgressLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            ordersInProgressLabel.bottomAnchor.constraint(equalTo: ordersInProgressTitleLabel.bottomAnchor),
            
            lineSecondImage.topAnchor.constraint(equalTo: ordersInProgressTitleLabel.bottomAnchor, constant: AccountInterfaceConstraints.Line.topSpace),
            lineSecondImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            addAnOrderButton.topAnchor.constraint(equalTo: lineSecondImage.bottomAnchor, constant: AccountInterfaceConstraints.Line.topSpace),
            addAnOrderButton.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            addAnOrderButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: AccountInterfaceConstraints.Button.trailing),
            addAnOrderButton.heightAnchor.constraint(equalToConstant: Button.Size.accountButtonHeight),
            addAnOrderButton.widthAnchor.constraint(equalToConstant: Button.Size.accountButtonWidth),
            
            yourOrdersButton.topAnchor.constraint(equalTo: addAnOrderButton.topAnchor),
            yourOrdersButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: AccountInterfaceConstraints.Button.leading),
            yourOrdersButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            yourOrdersButton.heightAnchor.constraint(equalToConstant: Button.Size.accountButtonHeight),
            yourOrdersButton.widthAnchor.constraint(equalToConstant: Button.Size.accountButtonWidth),
            
            logOutButton.topAnchor.constraint(equalTo: addAnOrderButton.bottomAnchor, constant: AccountInterfaceConstraints.Button.top),
            logOutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: Button.Size.accountButtonHeight),
            logOutButton.widthAnchor.constraint(equalToConstant: Button.Size.accountButtonWidth),
            logOutButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
