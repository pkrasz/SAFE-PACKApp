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
            
            productNameTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constans.Label.titleTop),
            productNameTitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            productNameTitleLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: Constans.Label.titleTrailing),
            
            productNameLabel.topAnchor.constraint(equalTo: productNameTitleLabel.topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: productNameTitleLabel.trailingAnchor),
            productNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            productNameLabel.bottomAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor),
            
            productImageView.topAnchor.constraint(equalTo: productNameTitleLabel.bottomAnchor, constant: Constans.Label.titleTop),
            productImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            productImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Constans.Image.multiplier),
            productImageView.widthAnchor.constraint(equalToConstant: Constans.Image.height),
            
            recommendedTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: Constans.Label.titleTop),
            recommendedTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constans.Label.titleTop),
            recommendedTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeOfPackageTitleLabel.leadingAnchor),
            
            recommendedLabelOne.topAnchor.constraint(equalTo: recommendedTitleLabel.bottomAnchor, constant: Constans.Label.recommendedTop),
            recommendedLabelOne.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelTwo.topAnchor.constraint(equalTo: recommendedLabelOne.bottomAnchor, constant: Constans.Label.betweenSpace),
            recommendedLabelTwo.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelThree.topAnchor.constraint(equalTo: recommendedLabelTwo.bottomAnchor, constant: Constans.Label.betweenSpace),
            recommendedLabelThree.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelFour.topAnchor.constraint(equalTo: recommendedLabelThree.bottomAnchor, constant: Constans.Label.betweenSpace),
            recommendedLabelFour.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelFive.topAnchor.constraint(equalTo: recommendedLabelFour.bottomAnchor, constant: Constans.Label.betweenSpace),
            recommendedLabelFive.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            recommendedLabelSix.topAnchor.constraint(equalTo: recommendedLabelFive.bottomAnchor, constant: Constans.Label.betweenSpace),
            recommendedLabelSix.leadingAnchor.constraint(equalTo: recommendedTitleLabel.leadingAnchor),
            
            sizeOfPackageTitleLabel.topAnchor.constraint(equalTo: recommendedTitleLabel.topAnchor),
            sizeOfPackageTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constans.Label.packSizeTitleTrailing),
            
            sizeOfPackageLabelOne.topAnchor.constraint(equalTo: sizeOfPackageTitleLabel.bottomAnchor, constant: Constans.Label.packSizeTitleTop),
            sizeOfPackageLabelOne.leadingAnchor.constraint(equalTo: sizeOfPackageTitleLabel.leadingAnchor),
            
            sizeOfPackageLabelTwo.topAnchor.constraint(equalTo: sizeOfPackageLabelOne.bottomAnchor, constant: Constans.Label.betweenSpace),
            sizeOfPackageLabelTwo.leadingAnchor.constraint(equalTo: sizeOfPackageTitleLabel.leadingAnchor),
            
            sizeOfPackageLabelThree.topAnchor.constraint(equalTo: sizeOfPackageLabelTwo.bottomAnchor, constant: Constans.Label.betweenSpace),
            sizeOfPackageLabelThree.leadingAnchor.constraint(equalTo: sizeOfPackageTitleLabel.leadingAnchor),
            sizeOfPackageLabelThree.bottomAnchor.constraint(lessThanOrEqualTo: recommendedLabelSix.bottomAnchor),
            
            sizesAdaptedTitleLabel.topAnchor.constraint(equalTo: recommendedLabelFive.bottomAnchor, constant: Constans.Label.adaptedTitleSizeTop),
            sizesAdaptedTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sizesAdaptedLabelOne.topAnchor.constraint(equalTo: sizesAdaptedTitleLabel.bottomAnchor, constant: Constans.Label.adaptedSizeTop),
            sizesAdaptedLabelOne.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sizesAdaptedLabelTwo.topAnchor.constraint(equalTo: sizesAdaptedLabelOne.bottomAnchor, constant: Constans.Label.betweenSpace),
            sizesAdaptedLabelTwo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sizesAdaptedLabelThree.topAnchor.constraint(equalTo: sizesAdaptedLabelTwo.bottomAnchor, constant: Constans.Label.betweenSpace),
            sizesAdaptedLabelThree.centerXAnchor.constraint(equalTo: centerXAnchor),
            sizesAdaptedLabelThree.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            sizeAdaptedFrame.topAnchor.constraint(equalTo: sizesAdaptedTitleLabel.topAnchor, constant: Constans.Frame.topAnchor),
            sizeAdaptedFrame.leadingAnchor.constraint(equalTo: sizesAdaptedTitleLabel.leadingAnchor, constant: Constans.Frame.topAnchor),
            sizeAdaptedFrame.trailingAnchor.constraint(equalTo: sizesAdaptedTitleLabel.trailingAnchor, constant: Constans.Frame.bottomAnchor),
            sizeAdaptedFrame.bottomAnchor.constraint(equalTo: sizesAdaptedLabelThree.bottomAnchor, constant: Constans.Frame.bottomAnchor)
        ])
    }
}

    //MARK: - Extensions

extension CatalogCollectionViewCell {
    enum Constans {
        enum Label {
            static let titleTop: CGFloat = 25
            static let titleTrailing: CGFloat = 10
            static let recommendedTop: CGFloat = 10
            static let betweenSpace: CGFloat = 1
            static let packSizeTitleTrailing: CGFloat = -25
            static let packSizeTitleTop: CGFloat = 10
            static let adaptedTitleSizeTop: CGFloat = 50
            static let adaptedSizeTop: CGFloat = 20
        }
        
        enum Frame {
            static let topAnchor: CGFloat = -10
            static let bottomAnchor: CGFloat = 10
        }
        
        enum Image {
            static let height: CGFloat = 250
            static let multiplier: CGFloat = 0.25
        }
    }
}
