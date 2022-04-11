//
//  LoginViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

final class LoginViewController: BaseViewController<LoginView> {
    
    
    //MARK: - Properties
    
    var currentPage = 0 {
        didSet {
            if currentPage == 0 {
                contentView.headerSignInButton.setTitleColor(Color.darkGreen, for: .normal)
                contentView.headerGetStartedButton.setTitleColor(Color.lightGreen, for: .normal)
                contentView.rightActivityBar.isHidden = true
                contentView.leftActivityBar.isHidden = false
            } else {
                contentView.headerGetStartedButton.setTitleColor(Color.darkGreen, for: .normal)
                contentView.headerSignInButton.setTitleColor(Color.lightGreen, for: .normal)
                contentView.rightActivityBar.isHidden = false
                contentView.leftActivityBar.isHidden = true
            }
        }
    }
    
    //MARK: - Setup
    
    override func setupView() {
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = Color.white
        
        contentView.pageViews.dataSource = self
        contentView.pageViews.delegate = self
        contentView.pageViews.register(LoginCollectionViewCell.self, forCellWithReuseIdentifier: LoginCollectionViewCell.identifier)
    }
    
    override func setupBindings() {
        
        let signInButtonTapped = UIAction{ [unowned self] _ in
            let rect = self.contentView.pageViews.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame
            self.contentView.pageViews.scrollRectToVisible(rect!, animated: true)
            currentPage = 0
        }
        contentView.headerSignInButton.addAction(signInButtonTapped, for: .touchUpInside)
        
        let getStartedButtonTapped = UIAction{ [unowned self] _ in
            let rect = self.contentView.pageViews.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame
            self.contentView.pageViews.scrollRectToVisible(rect!, animated: true)
            currentPage = 1
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
        cell.delegateLoginData = self
        if indexPath.row > 0 {
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
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension LoginViewController: LoginData {
    func loginData(button: String, email: String, password: String, repeatPassword: String) {
        if button == Buttons.Title.login {
            FirebaseClient.shared.signIn(email: email, password: password, view: self, pushView: AccountInterfaceViewController(), navigationController: navigationController!)
        } else {
            if password == repeatPassword {
                FirebaseClient.shared.createUser(email: email, password: password, view: self, pushView: AccountInfoViewController(), navigationController: navigationController!)
            } else {
                showAlert(title: "Password problem", message: "Repeated password does not match", actions: [UIAlertAction(title: "Back", style: .default, handler: nil)])
            }
        }
    }
}
    
    
