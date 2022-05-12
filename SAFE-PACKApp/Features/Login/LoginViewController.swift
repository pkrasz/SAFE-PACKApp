//
//  LoginViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit



final class LoginViewController: BaseViewController<LoginView> {
    
    //MARK: - Properties
    
    var authorizationType: AuthorizationType = .login {
        didSet {
            switch authorizationType {
            case .login:
                    self.contentView.setupLogin()
            case .register:
                    self.contentView.setupRegister()
            }
        }
    }
    
    //MARK: - Lifecyce
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.pagesCollectionView.reloadData()
        self.navigationController?.navigationBar.backItem?.title = Empty.string
    }
    
    //MARK: - Setup
    
    override func setupView() {
        contentView.pagesCollectionView.dataSource = self
        contentView.pagesCollectionView.delegate = self
        contentView.pagesCollectionView.register(LoginCollectionViewCell.self, forCellWithReuseIdentifier: LoginCollectionViewCell.identifier)
    }
    
    override func setupBindings() {
        let signInButtonTapped = UIAction{ [unowned self] _ in
            self.contentView.pagesCollectionView.scrollToItem(at: .init(item: 0, section: 0), at: .left, animated: true)
            authorizationType = .login
        }
        contentView.headerSignInButton.addAction(signInButtonTapped, for: .touchUpInside)
        
        let getStartedButtonTapped = UIAction{ [unowned self] _ in
            self.contentView.pagesCollectionView.scrollToItem(at: .init(item: 1, section: 0), at: .right, animated: true)
            authorizationType = .register
        }
        contentView.headerGetStartedButton.addAction(getStartedButtonTapped, for: .touchUpInside)
    }
}

    //MARK: - Extensions

extension LoginViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoginCollectionViewCell.identifier, for: indexPath) as! LoginCollectionViewCell
        let autorizationType = AuthorizationType(rawValue: indexPath.item)
        cell.delegateLoginData = self
        cell.delegateForgetPassword = self

        cell.emailTextField.text = nil
        cell.passwordTextField.text = nil
        cell.repeatPasswordTextField.text = nil
        cell.headLabel.text = Labels.Text.headSignInLabel
        cell.loginButton.setTitle(Button.Title.login, for: .normal)
        cell.forgetPasswordLabel.isHidden = false
        cell.repeatPasswordTextField.isHidden = true
        cell.termsPrivatyLabel.isHidden = true
        cell.visibilityPasswordTwoButton.isHidden = true
        if autorizationType == .register {
            cell.headLabel.text = Labels.Text.headRegisterLabel
            cell.loginButton.setTitle(Button.Title.register, for: .normal)
            cell.forgetPasswordLabel.isHidden = true
            cell.repeatPasswordTextField.isHidden = false
            cell.termsPrivatyLabel.isHidden = false
            cell.visibilityPasswordTwoButton.isHidden = false
        }
        return cell
    }
}

extension LoginViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.pagesCollectionView.frame.width, height: contentView.pagesCollectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        authorizationType = AuthorizationType(rawValue: Int(scrollView.contentOffset.x / width)) ?? .login
    }
}

extension LoginViewController: LoginData {
    func loginData(email: String, password: String, repeatPassword: String) {
        if authorizationType == .login {
            contentView.activityIndicatorView.isHidden = false
            UserSession.shared.logIn(email: email, password: password) { [weak self] error, logStatus in
                if logStatus == false {
                    self?.contentView.activityIndicatorView.isHidden = true
                    self?.showAlert(title: Alert.Title.error, message: error, actions: [Alert.Action.close])
                } else {
                    self?.contentView.activityIndicatorView.isHidden = true
                    self?.navigationController?.popToRootViewController(animated: false)
                }
            }
        } else {
            if password == repeatPassword {
                contentView.activityIndicatorView.isHidden = false
                UserSession.shared.createUser(email: email, password: password) { [weak self] error, logStatus in
                    if logStatus == false {
                        self?.contentView.activityIndicatorView.isHidden = true
                        self?.showAlert(title: Alert.Title.error, message: error, actions: [Alert.Action.close])
                    } else {
                        let accountInfoViewController = AccountInfoViewController(newUser: true)
                        self?.contentView.activityIndicatorView.isHidden = true
                        self?.navigationController?.pushViewController(accountInfoViewController, animated: true)
                    }
                }
            } else {
                showAlert(title: Alert.Title.repeatPassword, message: Alert.Messege.passwordNotMatch, actions: [Alert.Action.close])
            }
        }
    }
}

extension LoginViewController: ForgetPassword {
    func forgetPassword() {
        let resetPasswordViewController = ResetPasswordViewController()
        navigationController?.pushViewController(resetPasswordViewController, animated: true)
    }
}

extension LoginViewController {
    enum AuthorizationType: Int {
        case login = 0
        case register = 1
    }
}

