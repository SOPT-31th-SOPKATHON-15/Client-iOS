//
//  ProductModel.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import Foundation

struct ProductModel {
    let productName: String
    let price: String
    let time: String
}

let sampleList = [
    [ProductModel(productName: "스타벅스 케이크", price: "7500", time: "20:00"),
     ProductModel(productName: "투썸 케이크", price: "5000", time: "18:02")
    ],
    [ProductModel(productName: "후드티", price: "65000", time: "14:02")],
    [ProductModel(productName: "스타벅스 케이크", price: "7500", time: "15:10")]
]

let sampleDate = [
    "11.20", "11.18", "11.10"
]
