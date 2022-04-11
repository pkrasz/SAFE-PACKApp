//
//  LoginCollectionViewCell.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 07/04/2022.
//

import UIKit

protocol LoginData {
    func loginData(button: String, email: String, password: String, repeatPassword: String)
}

class LoginCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "LoginCollectionViewCell "
    
    let headLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.headSignInLabel
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
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextFields.Text.passwordField
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 5
        textField.layer.shadowOffset = CGSize.zero
        textField.layer.shadowColor = UIColor.systemGray5.cgColor
        return textField
    }()
    
    let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextFields.Text.repeatPasswordField
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.isHidden = true
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 5
        textField.layer.shadowOffset = CGSize.zero
        textField.layer.shadowColor = UIColor.systemGray5.cgColor
        return textField
    }()
    
    let forgetPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.forgerPassword
        label.textColor = Color.fontShadow
        label.isHidden = false
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = Color.lightGreen
        button.setTitle(Buttons.Title.login, for: .normal)
        return button
    }()
    
    let termsPrivatyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.termsPrivacy
        label.textColor = Color.fontShadow
        label.font = label.font.withSize(12)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    var delegateLoginData: LoginData?
    
    //MARK: - Initializator
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupSubview()
        setupConstraints()
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    //MARK: - Setup
    private func setupView() {
        backgroundColor = Color.white
    }
    
    private func setupSubview() {
        
        addSubview(headLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgetPasswordLabel)
        addSubview(repeatPasswordTextField)
        addSubview(loginButton)
        addSubview(termsPrivatyLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headLabel.topAnchor.constraint(equalTo: topAnchor, constant: Labels.Size.topSpace),
            headLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            headLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: TextFields.Size.betweenSpace),
            emailTextField.widthAnchor.constraint(equalToConstant: TextFields.Size.width),
            emailTextField.heightAnchor.constraint(equalToConstant: Buttons.Size.height),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: TextFields.Size.betweenSpace),
            passwordTextField.widthAnchor.constraint(equalToConstant: TextFields.Size.width),
            passwordTextField.heightAnchor.constraint(equalToConstant: Buttons.Size.height),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: TextFields.Size.betweenSpace),
            repeatPasswordTextField.widthAnchor.constraint(equalToConstant: TextFields.Size.width),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: Buttons.Size.height),
            repeatPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            forgetPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: TextFields.Size.betweenSpace),
            forgetPasswordLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: Labels.Size.topSpace),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            //            loginButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: Buttons.Size.width),
            loginButton.heightAnchor.constraint(equalToConstant: Buttons.Size.height),
            
            termsPrivatyLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: Constants.termsPrivatyLabelTop),
            termsPrivatyLabel.widthAnchor.constraint(equalTo: loginButton.widthAnchor, constant: TextFields.Size.betweenSpace),
            termsPrivatyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            termsPrivatyLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
            
        ])
    }
    
    func setupBindings() {
        let tapButton = UIAction{ [unowned self] _ in
            delegateLoginData?.loginData(button: loginButton.titleLabel?.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassword: repeatPasswordTextField.text ?? "")
        }
        loginButton.addAction(tapButton, for: .touchUpInside)
    
}
}

extension LoginCollectionViewCell {
    enum Constants {
        static let termsPrivatyLabelTop: CGFloat = 12
    }
}
