//
//  RegisterView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

final class AccountInfoView: BaseView {
    
    //MARK: - SubView
    
    let backgroundImageView: UIImageView = {
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
        [backgroundImageView,
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
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
            
            nameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Label.titleTop),
            nameTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Label.titleLeading),
            nameTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: Constants.TextField.topSpace),
            nameTextField.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            nameTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.TextField.width),
            
            emailTitleLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: Constants.Label.topSpace),
            emailTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            emailTitleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: Constants.TextField.topSpace),
            emailLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            NIPTitleLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Constants.Label.topSpace),
            NIPTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            NIPTitleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor),

            NIPTextField.topAnchor.constraint(equalTo: NIPTitleLabel.bottomAnchor, constant: Constants.TextField.topSpace),
            NIPTextField.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            NIPTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            NIPTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.TextField.width),
            
            deliveryAddressTitleLabel.topAnchor.constraint(equalTo: NIPTextField.bottomAnchor, constant: Constants.Label.topSpace),
            deliveryAddressTitleLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            deliveryAddressTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),

            deliveryAddressTextField.topAnchor.constraint(equalTo: deliveryAddressTitleLabel.bottomAnchor, constant: Constants.TextField.topSpace),
            deliveryAddressTextField.leadingAnchor.constraint(equalTo: nameTitleLabel.leadingAnchor),
            deliveryAddressTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            deliveryAddressTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.TextField.width),
            
            lineImage.topAnchor.constraint(equalTo: deliveryAddressTextField.bottomAnchor, constant: Constants.Line.topSpace),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            approveButton.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: Constants.Line.topSpace),
            approveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            approveButton.heightAnchor.constraint(equalToConstant: Button.Size.accountButtonHeight),
            approveButton.widthAnchor.constraint(equalToConstant: Button.Size.accountButtonWidth),
            approveButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])
    }
}

    //MARK: - Extensions

extension AccountInfoView {
    enum Constants {
        enum Label {
            static let titleTop: CGFloat = 150
            static let titleLeading: CGFloat = 35
            static let topSpace: CGFloat = 10
        }
        
        enum TextField {
            static let topSpace: CGFloat = 5
            static let width: CGFloat = 100
        }
        
        enum Line {
            static let topSpace: CGFloat = 20
        }
    }
}

