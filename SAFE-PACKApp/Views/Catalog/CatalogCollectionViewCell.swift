//
//  CatalogCollectionViewCell.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 14/04/2022.
//

import UIKit

final class CatalogCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = Identifire.catalogCollectionViewCell
    
    //MARK: - Subview
    
    let productNameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.box
        label.font = .boldSystemFont(ofSize: Labels.FontSize.loginHeadLabel)
        label.textColor = Color.font
        return label
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.FontSize.loginHeadLabel)
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
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let recommendedLabelOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelFour: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelFive: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let recommendedLabelSix: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let sizeOfPackageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.sizeOfPackage
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let sizeOfPackageLabelOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let sizeOfPackageLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let sizeOfPackageLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let sizesAdaptedTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.recommended
        label.font = .boldSystemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.darkGreen
        return label
    }()
    
    let sizesAdaptedLabelOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let sizesAdaptedLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
        label.textColor = Color.font
        return label
    }()
    
    let sizesAdaptedLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Labels.FontSize.catalog)
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
            
            productNameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CatalogConstraints.Label.titleTop),
            productNameTitleLabel.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: CatalogConstraints.Label.titleLeading),
            
            productNameLabel.topAnchor.constraint(equalTo: productNameTitleLabel.topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: productNameTitleLabel.trailingAnchor),
            productNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: CatalogConstraints.Label.titleTrailing),
            productNameLabel.bottomAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor),
            
            productImageView.topAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor, constant: CatalogConstraints.Label.titleTop),
            productImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: CatalogConstraints.Image.height),
            productImageView.widthAnchor.constraint(equalToConstant: CatalogConstraints.Image.height),
            
            recommendedTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: CatalogConstraints.Label.titleTop),
            recommendedTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CatalogConstraints.Label.titleTop),
            recommendedTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeOfPackageTitleLabel.leadingAnchor),
            
            recommendedLabelOne.topAnchor.constraint(equalTo: recommendedTitleLabel.bottomAnchor, constant: CatalogConstraints.Label.recommendedTop),
            recommendedLabelOne.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelTwo.topAnchor.constraint(equalTo: recommendedLabelOne.bottomAnchor, constant: CatalogConstraints.Label.betweenSpace),
            recommendedLabelTwo.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelThree.topAnchor.constraint(equalTo: recommendedLabelTwo.bottomAnchor, constant: CatalogConstraints.Label.betweenSpace),
            recommendedLabelThree.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelFour.topAnchor.constraint(equalTo: recommendedLabelThree.bottomAnchor, constant: CatalogConstraints.Label.betweenSpace),
            recommendedLabelFour.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelFive.topAnchor.constraint(equalTo: recommendedLabelFour.bottomAnchor, constant: CatalogConstraints.Label.betweenSpace),
            recommendedLabelFive.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelSix.topAnchor.constraint(equalTo: recommendedLabelFive.bottomAnchor, constant: CatalogConstraints.Label.betweenSpace),
            recommendedLabelSix.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            sizeOfPackageTitleLabel.topAnchor.constraint(equalTo: recommendedTitleLabel.topAnchor),
            sizeOfPackageTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CatalogConstraints.Label.packSizeTitleTrailing),
            
            sizeOfPackageLabelOne.topAnchor.constraint(equalTo: sizeOfPackageTitleLabel.bottomAnchor, constant: CatalogConstraints.Label.packSizeTitleTop),
            sizeOfPackageLabelOne.leadingAnchor.constraint(equalTo: sizeOfPackageTitleLabel.leadingAnchor),
            
            sizeOfPackageLabelTwo.topAnchor.constraint(equalTo: sizeOfPackageLabelOne.bottomAnchor, constant: CatalogConstraints.Label.betweenSpace),
            sizeOfPackageLabelTwo.leadingAnchor.constraint(equalTo: sizeOfPackageTitleLabel.leadingAnchor),
            
            sizeOfPackageLabelThree.topAnchor.constraint(equalTo: sizeOfPackageLabelTwo.bottomAnchor, constant: CatalogConstraints.Label.betweenSpace),
            sizeOfPackageLabelThree.leadingAnchor.constraint(equalTo: sizeOfPackageTitleLabel.leadingAnchor),
            sizeOfPackageLabelThree.bottomAnchor.constraint(lessThanOrEqualTo: recommendedLabelSix.bottomAnchor),
            
            sizesAdaptedTitleLabel.topAnchor.constraint(equalTo: recommendedLabelFive.bottomAnchor, constant: CatalogConstraints.Label.adaptedTitleSizeTop),
            sizesAdaptedTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sizesAdaptedLabelOne.topAnchor.constraint(equalTo: sizesAdaptedTitleLabel.bottomAnchor, constant: CatalogConstraints.Label.adaptedSizeTop),
            sizesAdaptedLabelOne.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sizesAdaptedLabelTwo.topAnchor.constraint(equalTo: sizesAdaptedLabelOne.bottomAnchor, constant: CatalogConstraints.Label.betweenSpace),
            sizesAdaptedLabelTwo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sizesAdaptedLabelThree.topAnchor.constraint(equalTo: sizesAdaptedLabelTwo.bottomAnchor, constant: CatalogConstraints.Label.betweenSpace),
            sizesAdaptedLabelThree.centerXAnchor.constraint(equalTo: centerXAnchor),
            sizesAdaptedLabelThree.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            sizeAdaptedFrame.topAnchor.constraint(equalTo: sizesAdaptedTitleLabel.topAnchor, constant: CatalogConstraints.Frame.topAnchor),
            sizeAdaptedFrame.leadingAnchor.constraint(equalTo: sizesAdaptedTitleLabel.leadingAnchor, constant: CatalogConstraints.Frame.topAnchor),
            sizeAdaptedFrame.trailingAnchor.constraint(equalTo: sizesAdaptedTitleLabel.trailingAnchor, constant: CatalogConstraints.Frame.bottomAnchor),
            sizeAdaptedFrame.bottomAnchor.constraint(equalTo: sizesAdaptedLabelThree.bottomAnchor, constant: CatalogConstraints.Frame.bottomAnchor)
        ])
    }
}


