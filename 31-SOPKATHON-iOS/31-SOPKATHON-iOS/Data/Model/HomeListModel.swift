//
//  HomeListModel.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import Foundation
import UIKit

// MARK: - DataClass
struct HomeModel: Codable {
    let monthList: [MonthList]
}

// MARK: - MonthList
struct MonthList: Codable {
    let month: String
    let price, counts: Int
    
    func toImage() -> UIImage {
        var image = UIImage()
        if price < 5000 {
            image = UIImage(named: "img_face")!
        } else if price < 15000 {
            image = UIImage(named: "img_pizza")!
        } else if price < 50000 {
            image = UIImage(named: "img_lipstic")!
        } else if price < 150000 {
            image = UIImage(named: "img_ring")!
        } else if price < 300000 {
            image = UIImage(named: "img_airpods")!
        } else if price < 500000 {
            image = UIImage(named: "img_headset")!
        } else {
            image = UIImage(named: "img_ring")!
        }
        return image
    }
}
