//
//  WelcomeView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 05/04/2022.
//

import UIKit

final class WelcomeView: BaseView {
    
    //MARK: - SubView
    
    let welcomeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "welcomeFirst")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.stopAnimating()
        return image
    }()
    
    let darkLogoSPImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DarkLogoSAFE-PACK")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = Color.lightGreen
        button.setTitle(Buttons.Title.login, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let catalogButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = Color.lightGreen
        button.setTitle(Buttons.Title.products, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var logoTopAnchor: NSLayoutConstraint?

    
    //MARK: - Setup
    
    override func setupView() {
        
        backgroundColor = Color.white
        
        logoTopAnchor = darkLogoSPImageView.topAnchor.constraint(equalTo: topAnchor, constant: LogoTopAnchor.loading)
    }
    
    override func setupSubviews() {
        addSubview(welcomeImageView)
        addSubview(darkLogoSPImageView)
        addSubview(loginButton)
        addSubview(catalogButton)
    }
    
    override func setupConstraints() {
        guard let logoTopAnchor = logoTopAnchor else {return}

        NSLayoutConstraint.activate([
            
            darkLogoSPImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            darkLogoSPImageView.heightAnchor.constraint(equalToConstant: LogoSize.height),
            darkLogoSPImageView.widthAnchor.constraint(equalToConstant: LogoSize.width),
            darkLogoSPImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            logoTopAnchor,
            loginButton.topAnchor.constraint(equalTo: darkLogoSPImageView.bottomAnchor, constant: 35),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: Buttons.Size.height),
            loginButton.widthAnchor.constraint(equalToConstant: Buttons.Size.width),
            
            catalogButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            catalogButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            catalogButton.heightAnchor.constraint(equalToConstant: Buttons.Size.height),
            catalogButton.widthAnchor.constraint(equalToConstant: Buttons.Size.width)
            
            
        ])
    }
    
    // MARK: - Methods
    
    func logoAnimation() {
        
        logoTopAnchor?.constant = LogoTopAnchor.welcome
        
        UIView.animate(withDuration: 2) {
            self.layoutIfNeeded()
        } completion: { _ in
            self.loginButton.isHidden = false
            self.catalogButton.isHidden = false
        }
    }
    
}
