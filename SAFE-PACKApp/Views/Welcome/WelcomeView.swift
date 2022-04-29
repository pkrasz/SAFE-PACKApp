//
//  WelcomeView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 05/04/2022.
//

import UIKit

final class WelcomeView: BaseView {
    
    //MARK: - Properties
    
    var logoTopAnchor: NSLayoutConstraint?

    //MARK: - SubView
    
    let welcomeImageView: UIImageView = {
        let image = UIImageView()
        image.image = Image.welcomeBackground
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.stopAnimating()
        return image
    }()
    
    let LogoSPImageView: UIImageView = {
        let image = UIImageView()
        image.image = Image.logoSafePack
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Subview.cornerRadius
        button.backgroundColor = Color.lightGreen
        button.setTitle(Button.Title.login, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let catalogButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Subview.cornerRadius
        button.backgroundColor = Color.lightGreen
        button.setTitle(Button.Title.products, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = Color.white
        
        logoTopAnchor = LogoSPImageView.topAnchor.constraint(equalTo: topAnchor, constant: LogoTopAnchor.loading)
    }
    
    override func setupSubviews() {
        addSubview(welcomeImageView)
        addSubview(LogoSPImageView)
        addSubview(loginButton)
        addSubview(catalogButton)
    }
    
    override func setupConstraints() {
        guard let logoTopAnchor = logoTopAnchor else {return}

        NSLayoutConstraint.activate([
            
            LogoSPImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            LogoSPImageView.heightAnchor.constraint(equalToConstant: LogoSize.height),
            LogoSPImageView.widthAnchor.constraint(equalToConstant: LogoSize.width),
            LogoSPImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            logoTopAnchor,
            loginButton.topAnchor.constraint(equalTo: LogoSPImageView.bottomAnchor, constant: WelcomeConstraints.logoBottom),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: Button.Size.height),
            loginButton.widthAnchor.constraint(equalToConstant: Button.Size.width),
            
            catalogButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: WelcomeConstraints.loginBottom),
            catalogButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            catalogButton.heightAnchor.constraint(equalToConstant: Button.Size.height),
            catalogButton.widthAnchor.constraint(equalToConstant: Button.Size.width)
            
            
        ])
    }
    
    // MARK: - Methods
    
    func logoAnimation() {
        logoTopAnchor?.constant = LogoTopAnchor.welcome
        
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        } completion: { _ in
            self.loginButton.isHidden = false
            self.catalogButton.isHidden = false
        }
    }
    
}
