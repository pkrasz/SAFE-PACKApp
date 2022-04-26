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
        image.image = Image.backgroundFour
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let invoicePDFView: PDFView = {
        let pdf = PDFView()
        pdf.translatesAutoresizingMaskIntoConstraints = false
        pdf.layer.cornerRadius = 10
        pdf.layer.borderColor = Color.darkGreen.cgColor
        pdf.layer.borderWidth = 1
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
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Color.darkGreen.cgColor
        button.backgroundColor = .white
        button.setTitle(Buttons.Title.saveToPhone, for: .normal)
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
        
            invoicePDFView.topAnchor.constraint(equalTo: topAnchor, constant: 140),
            invoicePDFView.leadingAnchor.constraint(equalTo: leadingAnchor),
            invoicePDFView.trailingAnchor.constraint(equalTo: trailingAnchor),
            invoicePDFView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.4142),
            
            availabilityUIImage.topAnchor.constraint(equalTo: invoicePDFView.topAnchor, constant: 10),
            availabilityUIImage.leadingAnchor.constraint(greaterThanOrEqualTo: invoicePDFView.leadingAnchor),
            availabilityUIImage.trailingAnchor.constraint(equalTo: invoicePDFView.trailingAnchor, constant: -10),
            availabilityUIImage.bottomAnchor.constraint(lessThanOrEqualTo: invoicePDFView.bottomAnchor),
            
            saveToPhoneButton.topAnchor.constraint(equalTo: invoicePDFView.bottomAnchor, constant: 25),
            saveToPhoneButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveToPhoneButton.heightAnchor.constraint(equalToConstant: Buttons.Size.accountButtonHeight),
            saveToPhoneButton.widthAnchor.constraint(equalToConstant: Buttons.Size.accountButtonWidth),
            saveToPhoneButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
