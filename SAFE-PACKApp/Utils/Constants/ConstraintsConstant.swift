//
//  ConstraintsConstant.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 29/04/2022.
//

import UIKit

enum WelcomeConstraints {
    static let logoBottom: CGFloat = 35
    static let loginBottom: CGFloat = 20
}

enum LoginConstraint {
    static let repeatPasswordLabelTop: CGFloat = 240
    static let headerSignInButtonTop: CGFloat = 162
    static let pageViewsBottom: CGFloat = -200
}

enum LoginCellConstraints {
    static let topHeadLabel: CGFloat = 29
    
    enum TextField {
        static let betweenSpace: CGFloat = 20
        static let width: CGFloat = 299
    }
    
    enum VisibilityButton {
        static let topAnchor: CGFloat = 5
        static let trailingAnchor: CGFloat = -10
        static let bottomAnchor: CGFloat = -5
    }
}

enum CatalogConstraints {
    static let collectionTop: CGFloat = 106
    
    enum Label {
        static let titleTop: CGFloat = 25
        static let titleLeading: CGFloat = 128
        static let titleTrailing: CGFloat = -128
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
    }
}

enum AccountInterfaceConstraints {
    enum Label {
        static let firstTitleTop: CGFloat = 127
        static let secondTitleTop: CGFloat = 10
        static let titleLeading: CGFloat = 35
        static let between: CGFloat = 5
    }
    
    enum Line {
        static let topSpace: CGFloat = 20
    }
    
    enum Button {
        static let top: CGFloat = 10
        static let leading: CGFloat = 5
        static let trailing: CGFloat = -5
    }
}

enum AccountInfoConstraints {
    enum Label {
        static let titleTop: CGFloat = 127
        static let titleLeading: CGFloat = 35
        static let topSpace: CGFloat = 10
    }
    
    enum TextField {
        static let topSpace: CGFloat = 5
        static let width: CGFloat = 100
    }
    
    enum Line {
        static let topSpace: CGFloat = 20
    }
}

enum OrdersCellConstraints {
    static let orderLabelTop: CGFloat = 10
    static let dateLabelLeading: CGFloat = 1
    static let imageTrailing: CGFloat = -10
}

enum OrdersConstraints {
    static let bottom: CGFloat = -270
        static let leading: CGFloat = 30
        static let trailing: CGFloat = -30
    
    enum Label {
        static let allOrdersTop: CGFloat = 127
        static let topSpace: CGFloat = 10
        static let betweenSpace: CGFloat = 1
    }
    
    enum Line {
        static let topSpace: CGFloat = 20
    }
}

enum SingleOrderConstraints {
    enum Background {
        static let topSpace: CGFloat = 140
        static let height: CGFloat = 325
        static let width: CGFloat = 365
    }
    
    enum Label {
        static let topSpace: CGFloat = 20
        static let leadingSpace: CGFloat = 20
        static let statusWidth: CGFloat = 110
        static let betweenTopSpace: CGFloat = 10
        static let betweenSpace: CGFloat = 1
        static let betweenColumnSpace: CGFloat = 45
    }
    
    enum Line {
        static let topSpace: CGFloat = 20
    }
    
    enum TableView {
        static let topSpace: CGFloat = 10
        static let bottomSpace: CGFloat = -10
    }
    
    enum Button {
        static let topSpace: CGFloat = 25
    }
}

enum InvoiceConstraints {
    static let PDFTopSpace: CGFloat = 140
    static let proporcionA4: CGFloat = 1.4142
    static let imageTopSpace: CGFloat = 10
    static let imageTrailing: CGFloat = -10
    static let buttonTopSpace: CGFloat = 25
}

enum AddNewOrderCellConstraints {
    enum Label {
        static let topSpace: CGFloat = 7
        static let betweenSpace: CGFloat = 1
        static let productLeading: CGFloat = 50
        static let sizeLabelLeading: CGFloat = 15
    }
    
    enum Image {
        static let topAnchor: CGFloat = 10
        static let bottomAnchor: CGFloat = -10
    }
    
    enum TextField {
        static let height: CGFloat = 23
        static let width: CGFloat = 85
    }
    
    enum Button {
        static let height: CGFloat = 31
        static let bottom: CGFloat = -9
    }
}

enum AddNewOrderConstraints {
    static let collectionViewTop: CGFloat = 126
    static let collectionViewBottom: CGFloat = -380
}
