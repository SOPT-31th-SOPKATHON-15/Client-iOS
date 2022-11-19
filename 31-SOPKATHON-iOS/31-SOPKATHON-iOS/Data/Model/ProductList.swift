//
//  ProductList.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import Foundation

// MARK: - ProductList
struct ProductListModel: Codable {
    let year, month, day, time: String
    let productName: String
    let price: Int
}
