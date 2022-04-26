//
//  ResetPasswordView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 25/04/2022.
//

import UIKit

final class ResetPasswordView: BaseView {
    
    //MARK: - Subview
    
    let background: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.accountInterfaceBackground
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let headLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.resetYourPassword
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = Color.font
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextFields.Text.emailField
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 5
        textField.layer.shadowOffset = CGSize.zero
        textField.layer.shadowColor = UIColor.systemGray5.cgColor
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let resetPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = Color.lightGreen
        button.setTitle(Buttons.Title.resetPassword, for: .normal)
        return button
    }()
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = Color.white
    }
    
    override func setupSubviews() {
        [background,
         headLabel,
        emailTextField,
        resetPasswordButton]
            .forEach(addSubview)
    }
    
   override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headLabel.topAnchor.constraint(equalTo: topAnchor, constant: 240),
            headLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            headLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: TextFields.Size.betweenSpace),
            emailTextField.widthAnchor.constraint(equalToConstant: TextFields.Size.width),
            emailTextField.heightAnchor.constraint(equalToConstant: Buttons.Size.height),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Labels.Size.topSpace),
            resetPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetPasswordButton.widthAnchor.constraint(equalToConstant: Buttons.Size.width),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: Buttons.Size.height),
            
        ])
    }
    
}
