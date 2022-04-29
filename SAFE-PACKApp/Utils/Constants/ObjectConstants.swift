//
//  ObjectConstants.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 29/04/2022.
//

import UIKit

enum StatusInt {
    static let awaitingAccepted: Int = 0
    static let inProgress: Int = 1
    static let realized: Int = 2
    static let awaitingPayment: Int = 3
    static let unpaid: Int = 4
}

enum Status {
    static let awaitingAccepted: String = "Awaiting accepted"
    static let inProgress: String = "In progress"
    static let realized: String = "Realized"
    static let awaitingPayment: String = "Awaiting payment"
    static let unpaid: String = "Unpaid"
}
