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
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        return label
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.size
        label.font = .systemFont(ofSize: Labels.FontSize.shopCells)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let lengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.shopCells)
        label.textColor = Color.font
        return label
    }()
    
    let widthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.shopCells)
        label.textColor = Color.font
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.shopCells)
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
        label.font = .systemFont(ofSize: Labels.FontSize.shopCells)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.shopCells)
        label.textColor = Color.font
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.amount
        label.font = .systemFont(ofSize: Labels.FontSize.shopCells)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let amountTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = Subview.borderWidth
        textField.layer.borderColor = Color.fontShadow.cgColor
        textField.keyboardType = .numberPad
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
            
            productNameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: AddNewOrderCellConstraints.Label.topSpace),
            productNameTitleLabel.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: AddNewOrderCellConstraints.Label.productLeading),
            
            productNameLabel.topAnchor.constraint(equalTo: productNameTitleLabel.topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: productNameTitleLabel.trailingAnchor),
            productNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            productNameLabel.bottomAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor),
            
            sizeLabel.topAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor, constant: AddNewOrderCellConstraints.Label.topSpace),
            sizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AddNewOrderCellConstraints.Label.sizeLabelLeading),
            
            lengthLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: AddNewOrderCellConstraints.Label.betweenSpace),
            lengthLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            lengthLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeLabel.trailingAnchor),
            
            widthLabel.topAnchor.constraint(equalTo: lengthLabel.bottomAnchor, constant: AddNewOrderCellConstraints.Label.betweenSpace),
            widthLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            widthLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeLabel.trailingAnchor),
            
            heightLabel.topAnchor.constraint(equalTo: widthLabel.bottomAnchor, constant: AddNewOrderCellConstraints.Label.betweenSpace),
            heightLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            heightLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeLabel.trailingAnchor),
            
            priceTitleLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: AddNewOrderCellConstraints.Label.topSpace),
            priceTitleLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: priceTitleLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceTitleLabel.trailingAnchor),
            priceLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor),
            
            productImageView.topAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor, constant: AddNewOrderCellConstraints.Image.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: widthLabel.trailingAnchor, constant: AddNewOrderCellConstraints.Image.topAnchor),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AddNewOrderCellConstraints.Image.bottomAnchor),
            productImageView.bottomAnchor.constraint(equalTo: addToBasketButton.topAnchor, constant: AddNewOrderCellConstraints.Image.bottomAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor, constant: AddNewOrderCellConstraints.Label.topSpace),
            amountLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            amountLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            amountTextField.topAnchor.constraint(equalTo: amountLabel.bottomAnchor),
            amountTextField.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            amountTextField.widthAnchor.constraint(equalToConstant: AddNewOrderCellConstraints.TextField.width),
            amountTextField.heightAnchor.constraint(equalToConstant: AddNewOrderCellConstraints.TextField.height),
            amountTextField.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            addToBasketButton.topAnchor.constraint(greaterThanOrEqualTo: productImageView.bottomAnchor),
            addToBasketButton.leadingAnchor.constraint(greaterThanOrEqualTo: amountTextField.trailingAnchor),
            addToBasketButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AddNewOrderCellConstraints.Button.bottom),
            addToBasketButton.heightAnchor.constraint(equalToConstant: AddNewOrderCellConstraints.Button.height),
            addToBasketButton.widthAnchor.constraint(equalToConstant: AddNewOrderCellConstraints.Button.height),
            addToBasketButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: AddNewOrderCellConstraints.Button.bottom)
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

//MARK: - Protocols

protocol AddToBasketButton {
    func addToBasketButton(amount: Int, an product: Product)
}
