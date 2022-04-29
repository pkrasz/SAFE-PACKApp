//
//  LoginView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

final class LoginView: BaseView {
    
    //MARK: - SubView
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = Image.loginBackground
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let headerSignInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Button.Title.signIn, for: .normal)
        button.setTitleColor(Color.darkGreen, for: .normal)
        button.setTitleColor(Color.darkGreen, for: .selected)
        button.backgroundColor = .white
        return button
    }()
    
    let headerGetStartedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Button.Title.getStarted, for: .normal)
        button.setTitleColor(Color.lightGreen, for: .normal)
        button.setTitleColor(Color.darkGreen, for: .selected)
        button.backgroundColor = .white
        return button
    }()
    
    let leftActivityBar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Color.darkGreen
        return image
    }()
    
    let rightActivityBar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Color.darkGreen
        image.isHidden = true
        return image
    }()
    
    let pageViews: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = Empty.cgFloat
        layout.minimumLineSpacing = Empty.cgFloat
        let pages = UICollectionView(frame: .zero, collectionViewLayout: layout)
        pages.translatesAutoresizingMaskIntoConstraints = false
        pages.backgroundColor = Color.white
        pages.showsHorizontalScrollIndicator = false
        pages.isPagingEnabled = true
        return pages
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = Color.font
        activityIndicator.isHidden = true
        return activityIndicator
    }()
    
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = Color.white
    }
    
    override func setupSubviews() {
        [pageViews,
         backgroundImageView,
         headerSignInButton,
         headerGetStartedButton,
         leftActivityBar,
         rightActivityBar,
        activityIndicatorView]
            .forEach(addSubview)
        
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headerSignInButton.topAnchor.constraint(equalTo: topAnchor, constant: LoginConstraint.headerSignInButtonTop),
            headerSignInButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerSignInButton.trailingAnchor.constraint(equalTo: centerXAnchor),
            headerSignInButton.heightAnchor.constraint(equalToConstant: Button.Size.headerButtonHeight),
            
            headerGetStartedButton.topAnchor.constraint(equalTo: headerSignInButton.topAnchor),
            headerGetStartedButton.leadingAnchor.constraint(equalTo: headerSignInButton.trailingAnchor),
            headerGetStartedButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerGetStartedButton.heightAnchor.constraint(equalTo: headerSignInButton.heightAnchor),
            
            leftActivityBar.bottomAnchor.constraint(equalTo: headerSignInButton.bottomAnchor),
            leftActivityBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftActivityBar.trailingAnchor.constraint(equalTo: headerSignInButton.trailingAnchor),
            leftActivityBar.widthAnchor.constraint(equalTo: headerSignInButton.widthAnchor),
            leftActivityBar.heightAnchor.constraint(equalToConstant: Button.Size.activityBarHeight),
            
            rightActivityBar.bottomAnchor.constraint(equalTo: headerSignInButton.bottomAnchor),
            rightActivityBar.leadingAnchor.constraint(equalTo: headerGetStartedButton.leadingAnchor),
            rightActivityBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightActivityBar.widthAnchor.constraint(equalTo: headerSignInButton.widthAnchor),
            rightActivityBar.heightAnchor.constraint(equalToConstant: Button.Size.activityBarHeight),
            
            pageViews.topAnchor.constraint(equalTo: headerSignInButton.bottomAnchor),
            pageViews.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageViews.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: LoginConstraint.pageViewsBottom),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // MARK: - Methods
    
    func setupLogin() {
            self.headerSignInButton.setTitleColor(Color.darkGreen, for: .normal)
            self.headerGetStartedButton.setTitleColor(Color.lightGreen, for: .normal)
            self.rightActivityBar.isHidden = true
            self.leftActivityBar.isHidden = false
    }
    
    func setupRegister() {
            self.headerGetStartedButton.setTitleColor(Color.darkGreen, for: .normal)
            self.headerSignInButton.setTitleColor(Color.lightGreen, for: .normal)
            self.rightActivityBar.isHidden = false
            self.leftActivityBar.isHidden = true
    }
}





