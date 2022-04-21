//
//  UserInfo.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 13/04/2022.
//

import Foundation

struct UserInfo: Decodable {
    
    let NIP: Int
    let address: String
    let companyName: String
}
