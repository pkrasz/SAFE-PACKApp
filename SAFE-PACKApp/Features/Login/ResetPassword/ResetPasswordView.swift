//
//  ResetPasswordView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 25/04/2022.
//

import UIKit

final class ResetPasswordView: BaseView {
    
    //MARK: - Subview
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.accountBackgroundOne
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let headLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.resetYourPassword
        label.font = .boldSystemFont(ofSize: Labels.FontSize.loginHeadLabel)
        label.textColor = Color.font
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextFields.Text.emailField
        textField.textColor = Color.font
        textField.layer.cornerRadius = Subview.cornerRadius
        textField.backgroundColor = .white
        textField.layer.shadowOpacity = Subview.shadowOpacity
        textField.layer.shadowRadius = Subview.shadowRadius
        textField.layer.shadowOffset = CGSize.zero
        textField.layer.shadowColor = Color.gray.cgColor
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let resetPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Subview.cornerRadius
        button.backgroundColor = Color.lightGreen
        button.setTitle(Button.Title.resetPassword, for: .normal)
        return button
    }()
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = Color.white
    }
    
    override func setupSubviews() {
        [backgroundImageView,
         headLabel,
        emailTextField,
        resetPasswordButton]
            .forEach(addSubview)
    }
    
   override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
            
            headLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.headLabelTop),
            headLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            headLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: TextFields.Size.betweenSpace),
            emailTextField.widthAnchor.constraint(equalToConstant: TextFields.Size.width),
            emailTextField.heightAnchor.constraint(equalToConstant: Button.Size.height),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.buttonTop),
            resetPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetPasswordButton.widthAnchor.constraint(equalToConstant: Button.Size.width),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: Button.Size.height),
            
        ])
    }
}

    //MARK: - Extensions

extension ResetPasswordView {
    enum Constants {
        static let buttonTop: CGFloat = 29
        static let headLabelTop: CGFloat = 200
    }
}
