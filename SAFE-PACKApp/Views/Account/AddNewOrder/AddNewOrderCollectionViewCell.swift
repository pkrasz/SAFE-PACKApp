//
//  AddNewOrderCollectionViewCell.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit

protocol AddToBasketButton {
    func addToBasketButton(amount: Int, an product: Product)
}

class AddNewOrderCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "AddNewOrderCollectionViewCell"
    var product: Product?
    var delegateaddToBasketButton: AddToBasketButton?
    
    //MARK: - Subview
    
    let productNameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.box
        label.font = .boldSystemFont(ofSize: Labels.Size.catalogFont)
        return label
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.size
        label.font = .systemFont(ofSize: 8)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let lengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 8)
        label.textColor = Color.font
        return label
    }()
    
    let widthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 8)
        label.textColor = Color.font
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 8)
        label.textColor = Color.font
        return label
    }()
    
    let productImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "cube.box")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.price
        label.font = .systemFont(ofSize: 8)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 8)
        label.textColor = Color.font
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.amount
        label.font = .systemFont(ofSize: 8)
        label.textColor = Color.fontShadow
        return label
    }()
    
    let amountTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Color.fontShadow.cgColor
        return textField
    }()
    
    let addToBasketButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
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
    
    func setupView() {
        backgroundColor = Color.white
        layer.borderColor = Color.darkGreen.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 15
    }
    
    func setupSubviews() {
        
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
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productNameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            productNameTitleLabel.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: 50),
            
            productNameLabel.topAnchor.constraint(equalTo: productNameTitleLabel.topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: productNameTitleLabel.trailingAnchor),
            productNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            productNameLabel.bottomAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor),
            
            sizeLabel.topAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor, constant: 7),
            sizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            lengthLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 1),
            lengthLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            lengthLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeLabel.trailingAnchor),
            
            widthLabel.topAnchor.constraint(equalTo: lengthLabel.bottomAnchor, constant: 1),
            widthLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            widthLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeLabel.trailingAnchor),
            
            heightLabel.topAnchor.constraint(equalTo: widthLabel.bottomAnchor, constant: 1),
            heightLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            heightLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeLabel.trailingAnchor),
            
            priceTitleLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 7),
            priceTitleLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: priceTitleLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceTitleLabel.trailingAnchor),
            priceLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor),
            
            productImageView.topAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor, constant: 10),
            productImageView.leadingAnchor.constraint(equalTo: widthLabel.trailingAnchor, constant: 10),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            productImageView.bottomAnchor.constraint(equalTo: addToBasketButton.topAnchor, constant: -10),
            
            amountLabel.topAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor, constant: 7),
            amountLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            amountLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            amountTextField.topAnchor.constraint(equalTo: amountLabel.bottomAnchor),
            amountTextField.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            amountTextField.widthAnchor.constraint(equalToConstant: 85),
            amountTextField.heightAnchor.constraint(equalToConstant: 23),
            amountTextField.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            addToBasketButton.topAnchor.constraint(greaterThanOrEqualTo: productImageView.bottomAnchor),
            addToBasketButton.leadingAnchor.constraint(greaterThanOrEqualTo: amountTextField.trailingAnchor),
            addToBasketButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            addToBasketButton.heightAnchor.constraint(equalToConstant: 31),
            addToBasketButton.widthAnchor.constraint(equalToConstant: 31),
            addToBasketButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9)
            
            
        ])
    }
    func setupBindings() {
        let tapAddToBasketButton = UIAction { [unowned self] _ in
            let amount = Int(amountTextField.text ?? "")
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
