//
//  Constatnts.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

enum Color {
    static let lightGreen: UIColor = UIColor(named: "mainGreen")!
    static let darkGreen: UIColor = UIColor(named: "darkGreen")!
    static let red: UIColor = UIColor(named: "mainRed")!
    static let yellow: UIColor = UIColor(named: "mainYellow")!
    static let white: UIColor = UIColor(named: "mainWhite")!
    static let font: UIColor = UIColor(named: "fontColor")!
    static let fontShadow: UIColor = UIColor(named: "fontShadow")!
}

enum Image {
    static let backbgroundLoginView: UIImage = UIImage(named: "signInHeader")!
    static let backgroundAccountViews: UIImage = UIImage(named:"CatalogBackground")!
    static let line: UIImage = UIImage(named:"line")!
    static let accountInterfaceBackground: UIImage = UIImage(named: "accountInterfaceBackground")!
    static let dottedFrame: UIImage = UIImage(named: "dottedFrame")!
    static let accountBackgroundTwo: UIImage = UIImage(named: "accountBackgroundTwo")!
}

enum Buttons {
    
    enum Title {
        static let login: String = "Login"
        static let register: String = "Register"
        static let products: String = "Products"
        static let signIn: String = "Sign In"
        static let getStarted: String = "Get Started"
        static let addAnOrder: String = "Add an order"
        static let yourInvoices: String = "Your invoices"
        static let yourOrders: String = "Your orders"
        static let logOut: String = "Log out"
        static let completeOrder: String = "Complete order"
        static let showInvoice: String = "Show invoice"
        static let saveToPhone: String = "Save to phone"
        static let approve: String = "Approve"
    }
    
    enum Size {
        static let height: CGFloat = 42
        static let width: CGFloat = 235
        static let activityBarHeight: CGFloat = 2
        static let headerButtonHeight: CGFloat = 47
        static let accountButtonHeight: CGFloat = 56
        static let accountButtonWidth: CGFloat = 156
       
    }
}

enum LogoSize {
    static let height: CGFloat = 75
    static let width: CGFloat = 309
}

enum LogoTopAnchor {
    static let loading: CGFloat = 420
    static let welcome: CGFloat = 312
}

enum TextFields {
    
    enum Text {
        static let emailField: String = "  E-mail..."
        static let passwordField: String = "  Password..."
        static let repeatPasswordField: String = "  Repeat password"
    }
    
    enum Size {
        static let betweenSpace: CGFloat = 20
        static let width: CGFloat = 299
    }
}

enum Labels {
    
    enum Text {
        static let termsPrivacy: String = "By creating an account, you agree to Wasty Terms of use and Privacy policy."
        static let headSignInLabel: String = "Login in your account"
        static let headRegisterLabel: String = "Create your account"
        static let forgerPassword: String = "Forget password?"
        static let name: String = "Name"
        static let email: String = "E-mail"
        static let deliveryAddress: String = "Delivery address"
        static let NIP: String = "NIP"
        static let unpaidInvoices: String = "Unpaid invoices :"
        static let ordersInProgress: String = "Orders in progress :"
        static let orederNumber: String = "Order number"
        static let orderAmount: String = "Order amount"
        static let leadTime: String = "Lead time"
        static let numberOfAllOrders: String = "Number of all orders"
        static let numberOfComleteOrders: String = "Number of complete orders"
        static let numberOfUnpaidOrders: String = "Number of unpaid orders"
        static let numberOfOrdersInProgress: String = "Number of orders in progress"
        static let numberOfAllInvoices: String = "Number of all invoices"
        static let numberOfUnpaidinvoices: String = "Number of unpaid invoices"
        static let numberOfPaidInvoices: String = "Number of paid invoices"
        static let numberOfInvoicesToPay: String = "Number of invoices to pay"
        static let box: String = "Box - "
        static let recommended = "Packaging recommended for:"
        static let sizeOfPackage = "Size of the package:"
        static let sizesAdapted = "Sizes adapted to:"
        static let size = "size:"
        static let price = "price: "
        static let amount = "amount"
        static let pln = " pln"
    }
    
    enum Size {
        static let topSpace: CGFloat = 29
        static let labelTitleFont: CGFloat = 17
        static let labelFont: CGFloat = 21
        static let catalogFont: CGFloat = 12
    }
}

enum LeadTime {
    static let fourWeeks: String = "4 weeks"
    static let eightWeeks: String = "8 weeks"
}

enum Status {
    static let waiting: String = "Waiting for accepted"
    static let inProgress: String = "In progress"
    static let realized: String = "Realized"
}

//enum Text {
//    static let size: CGFloat = 24
//}
