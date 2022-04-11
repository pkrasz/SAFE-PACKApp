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
}

enum Buttons {
    
    enum Title {
        static let login: String = "Login"
        static let register: String = "Register"
        static let products: String = "Products"
        static let signIn: String = "Sign In"
        static let getStarted: String = "Get Started"
    }
    
    enum Size {
        static let height: CGFloat = 42
        static let width: CGFloat = 235
        static let activityBarHeight: CGFloat = 2
        static let headerButtonHeight: CGFloat = 47
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
    }
    
    enum Size {
        static let topSpace: CGFloat = 29
    }
}

enum Text {
    static let size: CGFloat = 24
}
