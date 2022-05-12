//
//  AddNewOrderCollectionViewCell.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

final class AddNewOrderCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = Identifire.addNewOrderCollectionViewCell
    var product: Product?
    var delegateaddToBasketButton: AddToBasketButton?
    
    //MARK: - Subview
    
    let productNameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.box
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.font
        return label
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.label)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.size
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let lengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let widthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let productImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.price
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.amount
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let amountTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = Subview.borderWidth
        textField.layer.borderColor = Color.fontShadow.cgColor
        textField.keyboardType = .numberPad
        textField.textColor = Color.font
        return textField
    }()
    
    let addToBasketButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(Image.plus, for: .normal)
        button.layer.cornerRadius = Subview.cornerRadius
        button.layer.borderWidth = Subview.borerWidthShopCell
        button.layer.borderColor = Color.lightGreen.cgColor
        button.tintColor = Color.lightGreen
        return button
    }()
    
    //MARK: - Initializator
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setupConstraints()
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        amountTextField.text = nil
    }
    
    //MARK: - Setup
    
    private func setupView() {
        backgroundColor = Color.white
        layer.borderColor = Color.darkGreen.cgColor
        layer.borderWidth = Subview.borerWidthShopCell
        layer.cornerRadius = Subview.cornerRadius
    }
    
    private func setupSubviews() {
        [productNameTitleLabel,
         productNameLabel,
         sizeLabel,
         lengthLabel,
         widthLabel,
         heightLabel,
         productImageView,
         priceTitleLabel,
         priceLabel,
         amountLabel,
         amountTextField,
         addToBasketButton]
            .forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productNameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Label.topSpace),
            productNameTitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            productNameTitleLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: Constants.Label.productTrailing),
            
            productNameLabel.topAnchor.constraint(equalTo: productNameTitleLabel.topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: productNameTitleLabel.trailingAnchor),
            productNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            productNameLabel.bottomAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor),
            
            sizeLabel.topAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor, constant: Constants.Label.topSpace),
            sizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Label.sizeLabelLeading),
            
            lengthLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: Constants.Label.betweenSpace),
            lengthLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            lengthLabel.trailingAnchor.constraint(greaterThanOrEqualTo: sizeLabel.trailingAnchor),
            
            widthLabel.topAnchor.constraint(equalTo: lengthLabel.bottomAnchor, constant: Constants.Label.betweenSpace),
            widthLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            widthLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeLabel.trailingAnchor),
            
            heightLabel.topAnchor.constraint(equalTo: widthLabel.bottomAnchor, constant: Constants.Label.betweenSpace),
            heightLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            heightLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeLabel.trailingAnchor),
            
            priceTitleLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: Constants.Label.topSpace),
            priceTitleLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: priceTitleLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceTitleLabel.trailingAnchor),
            priceLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor),
            
            productImageView.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor, constant: Constants.Image.bottomAnchor),
            productImageView.leadingAnchor.constraint(equalTo: lengthLabel.trailingAnchor, constant: Constants.Image.topAnchor),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.Image.bottomAnchor),
            productImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Constants.Image.multiplier),
            
            amountLabel.topAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor, constant: Constants.Label.topSpace),
            amountLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            amountLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            amountTextField.topAnchor.constraint(equalTo: amountLabel.bottomAnchor),
            amountTextField.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            amountTextField.widthAnchor.constraint(equalToConstant: Constants.TextField.width),
            amountTextField.heightAnchor.constraint(equalToConstant: Constants.TextField.height),
            amountTextField.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            addToBasketButton.centerYAnchor.constraint(equalTo: amountTextField.centerYAnchor),
            addToBasketButton.leadingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: Constants.Button.leading),
            addToBasketButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            addToBasketButton.heightAnchor.constraint(equalToConstant: Constants.Button.height),
            addToBasketButton.widthAnchor.constraint(equalToConstant: Constants.Button.height)
        ])
    }
    
    private func setupBindings() {
        let tapAddToBasketButton = UIAction { [unowned self] _ in
            let amountString = amountTextField.text
            guard let amountString = amountString else {return}
            let amount = Int(amountString)
            guard let product = product else {return}
            guard let amount = amount else {return}
            delegateaddToBasketButton?.addToBasketButton(
                amount: amount,
                an: product
            )
        }
        addToBasketButton.addAction(tapAddToBasketButton, for: .touchUpInside)
    }
}

    //MARK: - Extensions

extension AddNewOrderCollectionViewCell {
    enum Constants {
        enum Label {
            static let topSpace: CGFloat = 7
            static let betweenSpace: CGFloat = 1
            static let productTrailing: CGFloat = 10
            static let sizeLabelLeading: CGFloat = 15
        }
        
        enum Image {
            static let topAnchor: CGFloat = 10
            static let bottomAnchor: CGFloat = -10
            static let multiplier: CGFloat = 0.6
        }
        
        enum TextField {
            static let height: CGFloat = 23
            static let width: CGFloat = 85
        }
        
        enum Button {
            static let height: CGFloat = 31
            static let leading: CGFloat = 5
        }
    }

}

    //MARK: - Protocols

protocol AddToBasketButton {
    func addToBasketButton(amount: Int, an product: Product)
}
