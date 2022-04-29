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
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = Subview.cornerRadius
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: Labels.FontSize.label)
        textField.textColor = Color.font
        return textField
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
    
    let NIPTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.NIP
        label.font = .systemFont(ofSize: Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let NIPTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = Subview.cornerRadius
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: Labels.FontSize.label)
        textField.textColor = Color.font
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let deliveryAddressTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.deliveryAddress
        label.font.withSize(Labels.FontSize.labelTitle)
        label.textColor = Color.fontShadow
        return label
    }()

    let deliveryAddressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = Subview.cornerRadius
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: Labels.FontSize.label)
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
        button.layer.cornerRadius = Subview.cornerRadius
        button.layer.borderWidth = Subview.borderWidth
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.setTitle(Button.Title.approve, for: .normal)
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
            
            nameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: AccountInfoConstraints.Label.titleTop),
            nameTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AccountInfoConstraints.Label.titleLeading),
            nameTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: AccountInfoConstraints.TextField.topSpace),
            nameTextField.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            nameTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: AccountInfoConstraints.TextField.width),
            
            emailTitleLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: AccountInfoConstraints.Label.topSpace),
            emailTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            emailTitleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: AccountInfoConstraints.TextField.topSpace),
            emailLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            NIPTitleLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: AccountInfoConstraints.Label.topSpace),
            NIPTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            NIPTitleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor),

            NIPTextField.topAnchor.constraint(equalTo: NIPTitleLabel.bottomAnchor, constant: AccountInfoConstraints.TextField.topSpace),
            NIPTextField.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            NIPTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            NIPTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: AccountInfoConstraints.TextField.width),
            
            deliveryAddressTitleLabel.topAnchor.constraint(equalTo: NIPTextField.bottomAnchor, constant: AccountInfoConstraints.Label.topSpace),
            deliveryAddressTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            deliveryAddressTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),

            deliveryAddressTextField.topAnchor.constraint(equalTo: deliveryAddressTitleLabel.bottomAnchor, constant: AccountInfoConstraints.TextField.topSpace),
            deliveryAddressTextField.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            deliveryAddressTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            deliveryAddressTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: AccountInfoConstraints.TextField.width),
            
            lineImage.topAnchor.constraint(equalTo: deliveryAddressTextField.bottomAnchor, constant: AccountInfoConstraints.Line.topSpace),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            approveButton.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: AccountInfoConstraints.Line.topSpace),
            approveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            approveButton.heightAnchor.constraint(equalToConstant: Button.Size.accountButtonHeight),
            approveButton.widthAnchor.constraint(equalToConstant: Button.Size.accountButtonWidth),
            approveButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])
    }
}

