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
    
    let unpaidInvoicesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.unpaidInvoices
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let unpaidInvoicesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(Labels.Size.labelTitleFont)
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
        label.font.withSize(Labels.Size.labelTitleFont)
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
//        button.titleLabel?.font = .boldSystemFont(ofSize: <#T##CGFloat#>)
        return button
    }()
    
    let yourInvoicesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.setTitle(Buttons.Title.yourInvoices, for: .normal)
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
         unpaidInvoicesTitleLabel,
         unpaidInvoicesLabel,
         ordersInProgressTitleLabel,
         ordersInProgressLabel,
         lineSecondImage,
         addAnOrderButton,
         yourInvoicesButton,
         yourOrdersButton,
         logOutButton]
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
            
            unpaidInvoicesTitleLabel.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: 20),
            unpaidInvoicesTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            
            unpaidInvoicesLabel.topAnchor.constraint(equalTo: unpaidInvoicesTitleLabel.topAnchor),
            unpaidInvoicesLabel.leadingAnchor.constraint(equalTo: unpaidInvoicesTitleLabel.trailingAnchor, constant: 5),
            unpaidInvoicesLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            unpaidInvoicesLabel.bottomAnchor.constraint(equalTo: unpaidInvoicesTitleLabel.bottomAnchor),
            
            ordersInProgressTitleLabel.topAnchor.constraint(equalTo: unpaidInvoicesTitleLabel.bottomAnchor, constant: 10),
            ordersInProgressTitleLabel.leadingAnchor.constraint(equalTo: unpaidInvoicesTitleLabel.leadingAnchor),
            
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
            
            yourInvoicesButton.topAnchor.constraint(equalTo: addAnOrderButton.bottomAnchor, constant: 10),
            yourInvoicesButton.leadingAnchor.constraint(equalTo: addAnOrderButton.leadingAnchor),
            yourInvoicesButton.trailingAnchor.constraint(equalTo: addAnOrderButton.trailingAnchor),
            yourInvoicesButton.heightAnchor.constraint(equalToConstant: Buttons.Size.accountButtonHeight),
            yourInvoicesButton.widthAnchor.constraint(equalToConstant: Buttons.Size.accountButtonWidth),
            yourInvoicesButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            yourOrdersButton.topAnchor.constraint(equalTo: addAnOrderButton.topAnchor),
            yourOrdersButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 5),
            yourOrdersButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            yourOrdersButton.heightAnchor.constraint(equalToConstant: Buttons.Size.accountButtonHeight),
            yourOrdersButton.widthAnchor.constraint(equalToConstant: Buttons.Size.accountButtonWidth),
            
            logOutButton.topAnchor.constraint(equalTo: yourInvoicesButton.topAnchor),
            logOutButton.leadingAnchor.constraint(equalTo: yourOrdersButton.leadingAnchor),
            logOutButton.trailingAnchor.constraint(equalTo: yourOrdersButton.trailingAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: Buttons.Size.accountButtonHeight),
            logOutButton.widthAnchor.constraint(equalToConstant: Buttons.Size.accountButtonWidth),
            logOutButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
            
        ])
        
    }
}
