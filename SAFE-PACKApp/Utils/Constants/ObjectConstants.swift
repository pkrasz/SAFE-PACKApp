//
//  ObjectConstants.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 29/04/2022.
//

import UIKit

enum StatusInt {
    static let awaitingAccepted: Int = 0
    static let awaitingPayment: Int = 1
    static let inProgress: Int = 2
    static let realized: Int = 3
    static let unpaid: Int = 4
}

enum Status {
    static let awaitingAccepted: String = "Awaiting accepted"
    static let awaitingPayment: String = "Awaiting payment"
    static let inProgress: String = "In progress"
    static let realized: String = "Realized"
    static let unpaid: String = "Unpaid"
}
