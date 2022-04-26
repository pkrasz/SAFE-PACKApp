//
//  CatalogCollectionViewCell.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 14/04/2022.
//

import UIKit

final class CatalogCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "CatalogCollectionViewCell"
    
    //MARK: - Subview
    
    let productNameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.box
        label.font = .boldSystemFont(ofSize: Labels.Size.topSpace)
        label.textColor = Color.font
        return label
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.topSpace)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let productImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = Color.fontShadow
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let recommendedTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.recommended
        label.font = .boldSystemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let recommendedLabelOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelFour: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelFive: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelSix: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let sizeOfPackageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.sizeOfPackage
        label.font = .boldSystemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let sizeOfPackageLabelOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let sizeOfPackageLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let sizeOfPackageLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let sizesAdaptedTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.recommended
        label.font = .boldSystemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let sizesAdaptedLabelOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let sizesAdaptedLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let sizesAdaptedLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.Size.catalogFont)
        label.textColor = Color.font
        return label
    }()
    
    let sizeAdaptedFrame: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Image.dottedFrame
        return image
    }()
    
    //MARK: - Initializator
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setupSubviews() {
        [productNameTitleLabel,
         productNameLabel,
         productImageView,
         recommendedTitleLabel,
         recommendedLabelOne,
         recommendedLabelTwo,
         recommendedLabelThree,
         recommendedLabelFour,
         recommendedLabelFive,
         recommendedLabelSix,
         sizeOfPackageTitleLabel,
         sizeOfPackageLabelOne,
         sizeOfPackageLabelTwo,
         sizeOfPackageLabelThree,
         sizesAdaptedTitleLabel,
         sizesAdaptedLabelOne,
         sizesAdaptedLabelTwo,
         sizesAdaptedLabelThree,
         sizeAdaptedFrame]
            .forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productNameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            productNameTitleLabel.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: 128),
            
            productNameLabel.topAnchor.constraint(equalTo: productNameTitleLabel.topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: productNameTitleLabel.trailingAnchor),
            productNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -128),
            productNameLabel.bottomAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor),
            
            productImageView.topAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor, constant: 25),
            productImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 250),
            productImageView.widthAnchor.constraint(equalToConstant: 250),
            
            recommendedTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 25),
            recommendedTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            recommendedTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeOfPackageTitleLabel.leadingAnchor),
            
            recommendedLabelOne.topAnchor.constraint(equalTo: recommendedTitleLabel.bottomAnchor, constant: 10),
            recommendedLabelOne.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelTwo.topAnchor.constraint(equalTo: recommendedLabelOne.bottomAnchor, constant: 1),
            recommendedLabelTwo.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelThree.topAnchor.constraint(equalTo: recommendedLabelTwo.bottomAnchor, constant: 1),
            recommendedLabelThree.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelFour.topAnchor.constraint(equalTo: recommendedLabelThree.bottomAnchor, constant: 1),
            recommendedLabelFour.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelFive.topAnchor.constraint(equalTo: recommendedLabelFour.bottomAnchor, constant: 1),
            recommendedLabelFive.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelSix.topAnchor.constraint(equalTo: recommendedLabelFive.bottomAnchor, constant: 1),
            recommendedLabelSix.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            sizeOfPackageTitleLabel.topAnchor.constraint(equalTo: recommendedTitleLabel.topAnchor),
            sizeOfPackageTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            sizeOfPackageLabelOne.topAnchor.constraint(equalTo: sizeOfPackageTitleLabel.bottomAnchor, constant: 10),
            sizeOfPackageLabelOne.leadingAnchor.constraint(equalTo: sizeOfPackageTitleLabel.leadingAnchor),
            
            sizeOfPackageLabelTwo.topAnchor.constraint(equalTo: sizeOfPackageLabelOne.bottomAnchor, constant: 1),
            sizeOfPackageLabelTwo.leadingAnchor.constraint(equalTo: sizeOfPackageTitleLabel.leadingAnchor),
            
            sizeOfPackageLabelThree.topAnchor.constraint(equalTo: sizeOfPackageLabelTwo.bottomAnchor, constant: 1),
            sizeOfPackageLabelThree.leadingAnchor.constraint(equalTo: sizeOfPackageTitleLabel.leadingAnchor),
            sizeOfPackageLabelThree.bottomAnchor.constraint(lessThanOrEqualTo: recommendedLabelSix.bottomAnchor),
            
            sizesAdaptedTitleLabel.topAnchor.constraint(equalTo: recommendedLabelFive.bottomAnchor, constant: 50),
            sizesAdaptedTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sizesAdaptedLabelOne.topAnchor.constraint(equalTo: sizesAdaptedTitleLabel.bottomAnchor, constant: 20),
            sizesAdaptedLabelOne.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sizesAdaptedLabelTwo.topAnchor.constraint(equalTo: sizesAdaptedLabelOne.bottomAnchor, constant: 1),
            sizesAdaptedLabelTwo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sizesAdaptedLabelThree.topAnchor.constraint(equalTo: sizesAdaptedLabelTwo.bottomAnchor, constant: 1),
            sizesAdaptedLabelThree.centerXAnchor.constraint(equalTo: centerXAnchor),
            sizesAdaptedLabelThree.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            sizeAdaptedFrame.topAnchor.constraint(equalTo: sizesAdaptedTitleLabel.topAnchor, constant: -10),
            sizeAdaptedFrame.leadingAnchor.constraint(equalTo: sizesAdaptedTitleLabel.leadingAnchor, constant: -10),
            sizeAdaptedFrame.trailingAnchor.constraint(equalTo: sizesAdaptedTitleLabel.trailingAnchor, constant: 10),
            sizeAdaptedFrame.bottomAnchor.constraint(equalTo: sizesAdaptedLabelThree.bottomAnchor, constant: 10)
        ])
    }
}


