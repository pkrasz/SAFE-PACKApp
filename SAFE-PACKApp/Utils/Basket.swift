//
//  Basket.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 20/04/2022.
//

import Foundation
import CoreImage

class Basket {
    
    //MARK: - Properties
    
    var productsList: [BasketProduct] = [] {
        didSet {
            basketValue = 0
            for product in productsList {
                basketValue += product.totalPrice
                
                if product.amount > 2000 {
                    if leadTime == LeadTime.fourWeeks {
                        leadTime = LeadTime.eightWeeks
                    }
                }
            }
        }
    }
    var basketValue: Double = 0
    let orderNumber: Int = 12345
    var leadTime: String = LeadTime.fourWeeks
    var deliveryAddress: String = ""
    let dateOfOrder: String = "21.04.2020"
    
    static let shared = Basket()
    
    //MARK: - Initializator
    
    private init() {
        
        let currentDataTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        
        let dataTimeString = formatter.string(from: currentDataTime)
        
        print("DATA: \(dataTimeString)")
        
        FirebaseClient.shared.getAccountInfo(userUID: UserSession.shared.UserInfo(about: User.id)) { [weak self] userInfo in
            self?.deliveryAddress = userInfo.address
        }
    }
    
    //MARK: - Methods
    
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
        
        let order = Order(productsList: productsList, orderNumber: orderNumber, orderPrice: basketValue, status: Status.waiting, dateOfTheOrder: dateOfOrder, deliveryAddress: deliveryAddress, leadTime: leadTime)
        completion(order)
        
        productsList.removeAll()
        basketValue = 0
    }
}

