//
//  SingleInvoiceView.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit
import PDFKit
import SwiftUI
import WebKit

final class InvoiceView: BaseView {

    //MARK: - SubView
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.invoiceBackground
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let invoicePDFView: PDFView = {
        let pdf = PDFView()
        pdf.translatesAutoresizingMaskIntoConstraints = false
        pdf.layer.cornerRadius = Subview.cornerRadius
        pdf.layer.borderColor = Color.darkGreen.cgColor
        pdf.layer.borderWidth = Subview.borderWidth
        pdf.layer.masksToBounds = true
        return pdf
    }()
    
    let availabilityUIImage: UIImageView = {
        let image = UIImageView(image: Image.availability)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = Color.fontShadow
        return image
    }()
    
    let saveToPhoneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Subview.cornerRadius
        button.layer.borderWidth = Subview.borderWidth
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.setTitle(Button.Title.saveToPhone, for: .normal)
        button.setTitleColor(Color.font, for: .normal)
        return button
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = Color.font
        return activityIndicator
    }()
    
    //MARK: - Setup
    
    override func setupSubviews() {
        [backgroundImageView,
         invoicePDFView,
         availabilityUIImage,
        saveToPhoneButton,
        activityIndicatorView]
            .forEach(addSubview)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor),
        
            invoicePDFView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.PDFTopSpace),
            invoicePDFView.leadingAnchor.constraint(equalTo: leadingAnchor),
            invoicePDFView.trailingAnchor.constraint(equalTo: trailingAnchor),
            invoicePDFView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.proporcionA4),
            
            availabilityUIImage.topAnchor.constraint(equalTo: invoicePDFView.topAnchor, constant: Constants.imageTopSpace),
            availabilityUIImage.leadingAnchor.constraint(greaterThanOrEqualTo: invoicePDFView.leadingAnchor),
            availabilityUIImage.trailingAnchor.constraint(equalTo: invoicePDFView.trailingAnchor, constant: Constants.imageTrailing),
            availabilityUIImage.bottomAnchor.constraint(lessThanOrEqualTo: invoicePDFView.bottomAnchor),
            
            saveToPhoneButton.topAnchor.constraint(equalTo: invoicePDFView.bottomAnchor, constant: Constants.buttonTopSpace),
            saveToPhoneButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveToPhoneButton.heightAnchor.constraint(equalToConstant: Button.Size.accountButtonHeight),
            saveToPhoneButton.widthAnchor.constraint(equalToConstant: Button.Size.accountButtonWidth),
            saveToPhoneButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

    //MARK: - Extensions

extension InvoiceView {
    enum Constants {
        static let PDFTopSpace: CGFloat = 140
        static let proporcionA4: CGFloat = 1.4142
        static let imageTopSpace: CGFloat = 10
        static let imageTrailing: CGFloat = -10
        static let buttonTopSpace: CGFloat = 25
    }

}
