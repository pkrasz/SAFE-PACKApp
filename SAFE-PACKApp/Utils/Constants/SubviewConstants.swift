//
//  SubviewConstants.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 29/04/2022.
//

import UIKit

//MARK: - Subviews

enum Subview {
    static let cornerRadius: CGFloat = 10
    static let shadowOpacity: Float = 1
    static let shadowRadius: CGFloat = 5
    static let numberOfLines: Int = 0
    static let borderWidth: CGFloat = 1
    static let borerWidthShopCell: CGFloat = 2
    static let minimumLineSpacing: CGFloat = 0
    static let minimumInteritemSpacing: CGFloat = 0
}

//MARK: - Identifires

enum Identifire {
    static let tableView: String = "UITableViewCell"
    static let loginCollectionViewCell: String = "LoginCollectionViewCell"
    static let catalogCollectionViewCell: String = "CatalogCollectionViewCell"
    static let ordersTableViewCell: String = "OrdersTableViewCell"
    static let addNewOrderCollectionViewCell: String = "AddNewOrderCollectionViewCell"
}
