//
//  LoginCollectionViewCell.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 07/04/2022.
//

import UIKit

class LoginCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = Identifire.loginCollectionViewCell
    var delegateLoginData: LoginData?
    var delegateForgetPassword: ForgetPassword?
    var passwordIsHidden: Bool = true
    var repeatPasswordIsHidden: Bool = true
    
    //MARK: - Subview
    
    let headLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextFields.Text.passwordField
        textField.textColor = Color.font
        textField.layer.cornerRadius = Subview.cornerRadius
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        textField.layer.shadowOpacity = Subview.shadowOpacity
        textField.layer.shadowRadius = Subview.shadowRadius
        textField.layer.shadowOffset = CGSize.zero
        textField.layer.shadowColor = Color.gray.cgColor
        return textField
    }()
    
    let visibilityPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(Image.eye, for: .normal)
        button.tintColor = Color.fontShadow
        return button
    }()
    
    let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextFields.Text.repeatPasswordField
        textField.textColor = Color.font
        textField.layer.cornerRadius = Subview.cornerRadius
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        textField.layer.shadowOpacity = Subview.shadowOpacity
        textField.layer.shadowRadius = Subview.shadowRadius
        textField.layer.shadowOffset = CGSize.zero
        textField.layer.shadowColor = Color.gray.cgColor
        return textField
    }()
    
    let visibilityPasswordTwoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(Image.eye, for: .normal)
        button.tintColor = Color.fontShadow
        return button
    }()
    
    let forgetPasswordLabel: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(Color.fontShadow, for: .normal)
        button.setTitle(Labels.Text.forgerPassword, for: .normal)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Subview.cornerRadius
        button.backgroundColor = Color.lightGreen
        return button
    }()
    
    let termsPrivatyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.termsPrivacy
        label.textColor = Color.fontShadow
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Subview.numberOfLines
        return label
    }()
    
    
    
    //MARK: - Initializator
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setupSubviews() {
        [headLabel,
         emailTextField,
         passwordTextField,
         forgetPasswordLabel,
         visibilityPasswordButton,
         repeatPasswordTextField,
         visibilityPasswordTwoButton,
         loginButton,
         termsPrivatyLabel]
            .forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topHeadLabel),
            headLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            headLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: Constants.TextField.betweenSpace),
            emailTextField.widthAnchor.constraint(equalToConstant: Constants.TextField.width),
            emailTextField.heightAnchor.constraint(equalToConstant: Button.Size.height),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: TextFields.Size.betweenSpace),
            passwordTextField.widthAnchor.constraint(equalToConstant: Constants.TextField.width),
            passwordTextField.heightAnchor.constraint(equalToConstant: Button.Size.height),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            visibilityPasswordButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: Constants.VisibilityButton.topAnchor),
            visibilityPasswordButton.leadingAnchor.constraint(greaterThanOrEqualTo: passwordTextField.leadingAnchor),
            visibilityPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: Constants.VisibilityButton.trailingAnchor),
            visibilityPasswordButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.VisibilityButton.bottomAnchor),
            
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: TextFields.Size.betweenSpace),
            repeatPasswordTextField.widthAnchor.constraint(equalToConstant: TextFields.Size.width),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: Button.Size.height),
            repeatPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            visibilityPasswordTwoButton.topAnchor.constraint(equalTo: repeatPasswordTextField.topAnchor, constant: Constants.VisibilityButton.topAnchor),
            visibilityPasswordTwoButton.trailingAnchor.constraint(equalTo: repeatPasswordTextField.trailingAnchor, constant: Constants.VisibilityButton.trailingAnchor),
            visibilityPasswordTwoButton.leadingAnchor.constraint(greaterThanOrEqualTo: repeatPasswordTextField.leadingAnchor),
            visibilityPasswordTwoButton.bottomAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: Constants.VisibilityButton.bottomAnchor),
            
            forgetPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: TextFields.Size.betweenSpace),
            forgetPasswordLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: Constants.topHeadLabel),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: Button.Size.width),
            loginButton.heightAnchor.constraint(equalToConstant: Button.Size.height),
            
            termsPrivatyLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: Constants.termsPrivatyLabelTop),
            termsPrivatyLabel.widthAnchor.constraint(equalTo: loginButton.widthAnchor, constant: TextFields.Size.betweenSpace),
            termsPrivatyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            termsPrivatyLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])
    }
    
    //MARK: - Methods
    
    func setupBindings() {
        let tapButton = UIAction{ [unowned self] _ in
            delegateLoginData?.loginData(
                email: emailTextField.text ?? Empty.string,
                password: passwordTextField.text ?? Empty.string,
                repeatPassword: repeatPasswordTextField.text ?? Empty.string
            )
        }
        loginButton.addAction(tapButton, for: .touchUpInside)
        
        let tapForgetPassword = UIAction{ [unowned self] _ in
            delegateForgetPassword?.forgetPassword()
        }
        forgetPasswordLabel.addAction(tapForgetPassword, for: .touchUpInside)
        
        let tapVisiblePassword = UIAction{ [unowned self] _ in
            self.passwordIsHidden.toggle()
            self.passwordTextField.isSecureTextEntry.toggle()
            if passwordIsHidden == true {
                visibilityPasswordButton.setImage(Image.eye, for: .normal)
            } else {
                visibilityPasswordButton.setImage(Image.eyeFill, for: .normal)
            }
        }
        visibilityPasswordButton.addAction(tapVisiblePassword, for: .touchUpInside)
        
        let tapVisiblePasswordTwo = UIAction{ [unowned self] _ in
            self.repeatPasswordIsHidden.toggle()
            self.repeatPasswordTextField.isSecureTextEntry.toggle()
            if repeatPasswordIsHidden == true {
                visibilityPasswordTwoButton.setImage(Image.eye, for: .normal)
            } else {
                visibilityPasswordTwoButton.setImage(Image.eyeFill, for: .normal)
            }
        }
        visibilityPasswordTwoButton.addAction(tapVisiblePasswordTwo, for: .touchUpInside)
    }
}

    //MARK: - Extensions

extension LoginCollectionViewCell {
    enum Constants {
        static let topHeadLabel: CGFloat = 29
        static let termsPrivatyLabelTop: CGFloat = 12
        
        enum TextField {
            static let betweenSpace: CGFloat = 20
            static let width: CGFloat = 299
        }
        
        enum VisibilityButton {
            static let topAnchor: CGFloat = 5
            static let trailingAnchor: CGFloat = -10
            static let bottomAnchor: CGFloat = -5
        }
    }
}

    //MARK: - Protocols

protocol LoginData {
    func loginData(email: String, password: String, repeatPassword: String)
}

protocol ForgetPassword {
    func forgetPassword()
}
