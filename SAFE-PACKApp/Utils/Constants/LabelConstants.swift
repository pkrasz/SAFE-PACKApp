//
//  LabelConstants.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 29/04/2022.
//

import UIKit

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
        static let ordersAwaitingPayment: String = "Orders awaiting payment :"
        static let ordersInProgress: String = "Orders in progress :"
        static let orederNumber: String = "Order number"
        static let orderAmount: String = "Order amount"
        static let leadTime: String = "Lead time"
        static let numberOfAllOrders: String = "All orders"
        static let numberOfAwaitingOrders: String = "Awaiting orders"
        static let numberOfUnpaidOrders: String = "Unpaid orders"
        static let numberOfOrdersInProgress: String = "Orders in progress"
        static let numberOfAllInvoices: String = "Number of all invoices"
        static let numberOfUnpaidinvoices: String = "Number of unpaid invoices"
        static let numberOfPaidInvoices: String = "Number of paid invoices"
        static let numberOfInvoicesToPay: String = "Number of invoices to pay"
        static let box: String = "Box - "
        static let recommended = "Packaging recommended for:"
        static let sizeOfPackage = "Size of the package:"
        static let sizesAdapted = "Sizes adapted to:"
        static let dateBig = "Date"
        static let status = "Status"
        static let size = "size:"
        static let price = "price: "
        static let amount = "amount: "
        static let pln = " pln"
        static let date = "date:"
        static let slash = "/"
        static let dash = "-"
        static let resetYourPassword: String = "Reset your password"

    }
    
    enum FontSize {
        static let labelTitle: CGFloat = 17
        static let label: CGFloat = 21
        static let catalog: CGFloat = 12
        static let loginHeadLabel: CGFloat = 24
        static let shopCells: CGFloat = 8
        static let tableView: CGFloat = 11
    }
}

enum LeadTime {
    static let fourWeeks: String = "4 weeks"
    static let eightWeeks: String = "8 weeks"
}
