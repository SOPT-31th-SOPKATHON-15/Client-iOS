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
            image = UIImage(named: "img_airpods")!
        } else if price < 300000 {
            image = UIImage(named: "img_ring")!
        } else if price < 500000 {
            image = UIImage(named: "img_headset")!
        } else {
            image = UIImage(named: "img_headset")!
        }
        return image
    }
    
    func toStatus() -> String {
        var str = ""
        if price < 5000 {
            str = "열심히 참는 중"
        } else if price < 15000 {
            str = "피자 한 판 만큼 모았어요"
        } else if price < 50000 {
            str = "샤넬 립스틱 만큼 모았어요!"
        } else if price < 150000 {
            str = "에어팟 만큼 모았어요!"
        } else if price < 300000 {
            str = "티파니 목걸이 만큼 모았어요!"
        } else if price < 500000 {
            str = "헤드셋 만큼 모았어요!"
        } else {
            str = "헤드셋 만큼 모았어요!"
        }
        return str
    }
    
    func toHomeListModel() -> HomeListModel {
        return HomeListModel(month: month,
                             price: price,
                             counts: counts,
                             image: self.toImage(),
                             status: self.toStatus())
    }
}

struct HomeListModel {
    let month: String
    let price, counts: Int
    let image: UIImage
    let status: String
}
