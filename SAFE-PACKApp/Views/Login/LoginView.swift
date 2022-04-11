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
        image.image = Image.backbgroundLoginView
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let headerSignInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Buttons.Title.signIn, for: .normal)
        button.setTitleColor(Color.darkGreen, for: .normal)
        button.setTitleColor(Color.darkGreen, for: .selected)
        button.backgroundColor = .white
        return button
    }()
    
    let headerGetStartedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Buttons.Title.getStarted, for: .normal)
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
        let pages = UICollectionView(frame: .zero, collectionViewLayout: layout)
        pages.translatesAutoresizingMaskIntoConstraints = false
        pages.backgroundColor = Color.white
        layout.scrollDirection = .horizontal
        pages.showsHorizontalScrollIndicator = false
        pages.isPagingEnabled = true
        return pages
    }()
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = Color.white
    }
    
    override func setupSubviews() {
        addSubview(pageViews)
        addSubview(backgroundImageView)
        addSubview(headerSignInButton)
        addSubview(headerGetStartedButton)
        addSubview(leftActivityBar)
        addSubview(rightActivityBar)
        
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headerSignInButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.headerSignInButtonTop),
            headerSignInButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerSignInButton.trailingAnchor.constraint(equalTo: centerXAnchor),
            headerSignInButton.heightAnchor.constraint(equalToConstant: Buttons.Size.headerButtonHeight),
            
            headerGetStartedButton.topAnchor.constraint(equalTo: headerSignInButton.topAnchor),
            headerGetStartedButton.leadingAnchor.constraint(equalTo: headerSignInButton.trailingAnchor),
            headerGetStartedButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerGetStartedButton.heightAnchor.constraint(equalTo: headerSignInButton.heightAnchor),
            
            leftActivityBar.bottomAnchor.constraint(equalTo: headerSignInButton.bottomAnchor),
            leftActivityBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftActivityBar.trailingAnchor.constraint(equalTo: headerSignInButton.trailingAnchor),
            leftActivityBar.widthAnchor.constraint(equalTo: headerSignInButton.widthAnchor),
            leftActivityBar.heightAnchor.constraint(equalToConstant: Buttons.Size.activityBarHeight),
            
            rightActivityBar.bottomAnchor.constraint(equalTo: headerSignInButton.bottomAnchor),
            rightActivityBar.leadingAnchor.constraint(equalTo: headerGetStartedButton.leadingAnchor),
            rightActivityBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightActivityBar.widthAnchor.constraint(equalTo: headerSignInButton.widthAnchor),
            rightActivityBar.heightAnchor.constraint(equalToConstant: Buttons.Size.activityBarHeight),
            
            pageViews.topAnchor.constraint(equalTo: headerSignInButton.bottomAnchor),
            pageViews.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageViews.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.pageViewsBottom)
        ])
    }
}

extension LoginView {
    enum Constants {
        static let headerSignInButtonTop: CGFloat = 162
        static let pageViewsBottom: CGFloat = -200
    }
}





