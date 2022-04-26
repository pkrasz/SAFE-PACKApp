//
//  OrdersTableViewCell.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 22/04/2022.
//

import UIKit

final class OrdersTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    static let identifier = "OrdersTableViewCell"
    
    //MARK: - Subview
    
    let orderNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.font
        return label
    }()
    
    let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Labels.Text.slash + Labels.Text.date
        label.font = .systemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.font
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Labels.Size.labelTitleFont)
        label.textColor = Color.font
        return label
    }()
    
    let availabilityUIImage: UIImageView = {
        let image = UIImageView(image: Image.availability)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = Color.fontShadow
        return image
    }()
    
    //MARK: - Initializator
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupSubviews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setupView() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = Color.darkGreen.cgColor
        backgroundColor = Color.white
    }
    
    private func setupSubviews() {
        [orderNumberLabel,
         dateTitleLabel,
         dateLabel,
         availabilityUIImage]
            .forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            orderNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            orderNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            dateTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dateTitleLabel.leadingAnchor.constraint(equalTo: orderNumberLabel.trailingAnchor),
            
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: dateTitleLabel.trailingAnchor, constant: 1),
            dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: availabilityUIImage.leadingAnchor),
            
            availabilityUIImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            availabilityUIImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
