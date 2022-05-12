//
//  Basket.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 20/04/2022.
//

import Foundation

final class Basket {
    
    //MARK: - Properties
    
    var productsList: [BasketProduct] = [] {
        didSet {
           recalculationBasketValue()
        }
    }
    var basketValue: Double = 0
    var orderNumber: String = Empty.string
    var leadTime: String = LeadTime.fourWeeks
    var deliveryAddress: String = Empty.string
    var dateOfOrder: String = Empty.string
    
    static let shared = Basket()
    
    //MARK: - Initializator
    
    private init() {
        reloadBasket()
    }

    //MARK: - Methods
    
    func recalculationBasketValue() {
        basketValue = 0
        for product in productsList {
            basketValue += product.totalPrice
            
            if product.amount > Constants.maxProductAmount {
                    leadTime = LeadTime.eightWeeks
            }
        }
    }
    
    func reloadBasket() {
        let currentDataTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        var dataTimeString = formatter.string(from: currentDataTime)
        dateOfOrder = dataTimeString
        formatter.dateFormat = Constants.dateForamt
        dataTimeString = formatter.string(from: currentDataTime)
        
        FirebaseClient.shared.getAccountInfo(userUID: UserSession.shared.UserInfo(about: User.id)) { [weak self] user in
            let NIP = String(user.NIP)
            self?.orderNumber = NIP.prefix(3) + dataTimeString
        }
        FirebaseClient.shared.getAccountInfo(userUID: UserSession.shared.UserInfo(about: User.id)) { [weak self] userInfo in
            self?.deliveryAddress = userInfo.address
        }
    }
    
    func addToBasket(_ amount: Int, of product: Product) {
        var productInBasket = false
        
        for index in 0..<productsList.count {
            if productsList[index].product == product {
                let totalPrice = Double(amount) * product.price
                productsList[index].amount += amount
                productsList[index].totalPrice += totalPrice
                productInBasket = true
            }
        }
        
        if productInBasket == false {
            let totalPrice = Double(amount) * product.price
            let basketProduct = BasketProduct(product: product, amount: amount, totalPrice: totalPrice)
            productsList.append(basketProduct)
        }
    }
    
    func removeFromBasket( product: BasketProduct) {
        for index in 0..<productsList.count {
            if productsList[index] == product {
                productsList.remove(at: index)
                break
            }
        }
    }
    
    func completeOrder(completion: @escaping (Order) -> Void) {
        let order = Order(productsList: productsList, orderNumber: orderNumber, orderPrice: basketValue, status: StatusInt.awaitingAccepted, dateOfTheOrder: dateOfOrder, deliveryAddress: deliveryAddress, leadTime: leadTime, documentName: Labels.Text.dash)
        completion(order)
        
        productsList.removeAll()
        basketValue = 0
        leadTime = LeadTime.fourWeeks
        reloadBasket()
    }
}

    //MARK: - Extensions
extension Basket {
    enum Constants {
        static let maxProductAmount: Int = 2000
        static let dateForamt: String = "HHmmss"
    }
}
