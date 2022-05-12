//
//  Constatnts.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

enum User {
    static let id: String = "id"
    static let email: String = "email"
}

enum Empty {
    static let string: String = ""
}

enum CollectionViewCell {
    static let widthMinus: CGFloat = 40
    static let heightDevide: CGFloat = 2
    static let heightMinus: CGFloat = 10
    static let miminumLineSpacing: CGFloat = 20
    static let sectionInset: CGFloat = 20
    static let sectionInsetTop: CGFloat = 10
    static let minimumInteritemSpacing: CGFloat = 10
}

enum OrderView {
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

enum Animate {
    static let time: Double = 0.5
}

