//
//  RegisterView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

final class AccountView: BaseView {
    
    //MARK: - SubView
    
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
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: Labels.Size.labelFont)
        textField.textColor = Color.font
        return textField
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
    
    let NIPTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.NIP
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let NIPTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: Labels.Size.labelFont)
        textField.textColor = Color.font
        return textField
    }()
    
    let deliveryAddressTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.deliveryAddress
        label.font.withSize(Labels.Size.labelTitleFont)
        label.textColor = Color.fontShadow
        return label
    }()

    let deliveryAddressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: Labels.Size.labelFont)
        textField.textColor = Color.font
        return textField
    }()
    
    let lineImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.line
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let approveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.setTitle(Buttons.Title.approve, for: .normal)
        button.setTitleColor(Color.darkGreen, for: .normal)
        return button
    }()
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = Color.white
    }
    
    override func setupSubviews() {
        
        [background,
         nameTitleLabel,
         nameTextField,
         emailTitleLabel,
         emailLabel,
         NIPTitleLabel,
         NIPTextField,
         deliveryAddressTitleLabel,
         deliveryAddressTextField,
         lineImage,
         approveButton]
            .forEach(addSubview)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            nameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 127),
            nameTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            nameTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            nameTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            emailTitleLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            emailTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            emailTitleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: 5),
            emailLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            NIPTitleLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            NIPTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            NIPTitleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor),

            NIPTextField.topAnchor.constraint(equalTo: NIPTitleLabel.bottomAnchor, constant: 5),
            NIPTextField.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            NIPTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            NIPTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            deliveryAddressTitleLabel.topAnchor.constraint(equalTo: NIPTextField.bottomAnchor, constant: 10),
            deliveryAddressTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            deliveryAddressTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),

            deliveryAddressTextField.topAnchor.constraint(equalTo: deliveryAddressTitleLabel.bottomAnchor, constant: 5),
            deliveryAddressTextField.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            deliveryAddressTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            deliveryAddressTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            lineImage.topAnchor.constraint(equalTo: deliveryAddressTextField.bottomAnchor, constant: 20),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            approveButton.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: 20),
            approveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            approveButton.heightAnchor.constraint(equalToConstant: Buttons.Size.accountButtonHeight),
            approveButton.widthAnchor.constraint(equalToConstant: Buttons.Size.accountButtonWidth),
            approveButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
            
        ])
    }
}

