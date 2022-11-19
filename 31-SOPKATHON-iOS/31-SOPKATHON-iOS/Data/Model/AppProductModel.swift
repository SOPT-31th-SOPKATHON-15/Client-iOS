
//  AddProductModel.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import Foundation

// MARK: - DataClass
struct AddProductModel: Codable {
    let id: Int
    let productName: String
    let price: Int
    let contents: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, productName, price, contents
        case userID = "userId"
    }
}
