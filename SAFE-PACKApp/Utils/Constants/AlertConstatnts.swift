//
//  AlertConstatnts.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 29/04/2022.
//

import UIKit

enum Alert {
    
    enum Title {
        static let error: String = "Error!"
        static let repeatPassword: String = "Repeat password!"
        static let correct: String = "Correct!"
        static let completeTheRegostration: String = "Complete the registration"
        static let change: String = "You made a change in:"
        static let noChange: String = "No changes were made"
        static let registrationNotCompleted: String = "Registration not completed"
        static let registrationComplete: String = "Registration completed!"
        static let orderPlaced: String = "Order placed!"
    }
    
    enum Messege {
        static let passwordNotMatch: String = "Password does not match"
        static let correctPasswordReset: String = "Please check your e-mail, we sent you a password reset messege"
        static let fillTheData: String = "Fill in the necessary data to go to the account"
        static let noChange: String = "You have not made any changes"
        static let registrationNotCompleted: String = "You need to fill in all the information"
        static let orderPlaced: String = "Your order has been registered, you can view it in [Your orders] "
        static let orderError: String = "There is an error, please check your internet connection and try again later."
    }
    
    enum Action {
        static let close: UIAlertAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        static let `continue`: UIAlertAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
    }

    enum ActionTitle {
        static let back: String = "Back"
        static let close: String = "Close"
        static let goToAccount: String = "Go to Account"
    }
}
