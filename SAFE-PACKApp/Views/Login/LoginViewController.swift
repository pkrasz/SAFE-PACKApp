//
//  LoginViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

enum AuthorizationType: Int {
    case login = 0
    case register = 1
}

final class LoginViewController: BaseViewController<LoginView> {
    
    
    //MARK: - Properties
    
    var autorizationType: AuthorizationType = .login {
        didSet {
            switch autorizationType {
            case .login:
                contentView.setupLogin()
            case .register:
                contentView.setupRegister()
            }
        }
    }
    
    //MARK: - Lifecyce
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.pageViews.reloadData()
    }
    
    //MARK: - Setup
    
    override func setupView() {
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = Color.white
        
//        contentView.activityIndicatorView.isHidden = true
        contentView.pageViews.dataSource = self
        contentView.pageViews.delegate = self
        contentView.pageViews.register(LoginCollectionViewCell.self, forCellWithReuseIdentifier: LoginCollectionViewCell.identifier)
    }
    
    override func setupBindings() {
        
        let signInButtonTapped = UIAction{ [unowned self] _ in
            self.contentView.pageViews.scrollToItem(at: .init(item: 0, section: 0), at: .left, animated: true)
            autorizationType = .login
        }
        contentView.headerSignInButton.addAction(signInButtonTapped, for: .touchUpInside)
        
        let getStartedButtonTapped = UIAction{ [unowned self] _ in
            self.contentView.pageViews.scrollToItem(at: .init(item: 1, section: 0), at: .right, animated: true)
            autorizationType = .register
        }
        contentView.headerGetStartedButton.addAction(getStartedButtonTapped, for: .touchUpInside)
        
    }
}

extension LoginViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoginCollectionViewCell.identifier, for: indexPath) as! LoginCollectionViewCell
        let autorizationType = AuthorizationType(rawValue: indexPath.item)
        cell.delegateLoginData = self
        cell.emailTextField.text = nil
        cell.passwordTextField.text = nil
        cell.repeatPasswordTextField.text = nil
        if autorizationType == .register {
            cell.headLabel.text = Labels.Text.headRegisterLabel
            cell.loginButton.setTitle(Buttons.Title.register, for: .normal)
            cell.forgetPasswordLabel.isHidden = true
            cell.repeatPasswordTextField.isHidden = false
            cell.termsPrivatyLabel.isHidden = false
        }
        return cell
    }
}

extension LoginViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.pageViews.frame.width, height: contentView.pageViews.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        autorizationType = AuthorizationType(rawValue: Int(scrollView.contentOffset.x / width)) ?? .login
    }
}

extension LoginViewController: LoginData {
    func loginData(email: String, password: String, repeatPassword: String) {
        if autorizationType == .login {
            contentView.activityIndicatorView.isHidden = false
            UserSession.shared.logIn(email: email, password: password) { [weak self] error, logStatus in
                if logStatus == false {
                    self?.contentView.activityIndicatorView.isHidden = true
                    self?.showAlert(title: "Error!", message: error, actions: [UIAlertAction(title: "Back", style: .default, handler: nil)])
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
                        self?.showAlert(title: "Error!", message: error, actions: [UIAlertAction(title: "Back", style: .default, handler: nil)])
                    } else {
                        let accountInfoViewController = AccountInfoViewController(newUser: true)
                        self?.contentView.activityIndicatorView.isHidden = true
                        self?.navigationController?.pushViewController(accountInfoViewController, animated: true)
                    }
                }
            } else {
                showAlert(title: "Repeat password!", message: "Password does not match", actions: [UIAlertAction(title: "Back", style: .default, handler: nil)])
            }
        }
    }
}


