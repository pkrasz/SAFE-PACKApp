//
//  Product.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 14/04/2022.
//

import Foundation

struct Product: Decodable, Encodable, Hashable {
    
    let name: String
    let DHL : String
    let height : String
    let inPost : String
    let length : String
    let pocztex : String
    let price : Double
    let recommendation : [String]
    let width : String
    
}
