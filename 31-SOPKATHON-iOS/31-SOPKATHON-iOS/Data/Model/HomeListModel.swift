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
            str = "티파니 반지 만큼 모았어요!"
        } else if price < 500000 {
            str = "헤드셋 만큼 모았어요!"
        } else {
            str = "헤드셋 만큼 모았어요!"
        }
        return str
    }
    
    func toBackground() -> UIColor {
        var color = UIColor()
        if price < 5000 {
            color = .white
        } else if price < 15000 {
            color = .myYellow
        } else if price < 50000 {
            color = .myRed
        } else if price < 150000 {
            color = .white
        } else if price < 300000 {
            color = .myPurple
        } else if price < 500000 {
            color = .myLightBlue
        } else {
            color = .myLightBlue
        }
        return color
    }
    
    func toHomeListModel() -> HomeListModel {
        return HomeListModel(month: month,
                             price: price,
                             counts: counts,
                             image: self.toImage(),
                             status: self.toStatus(),
                             color: toBackground())
    }
}

struct HomeListModel {
    let month: String
    let price, counts: Int
    let image: UIImage
    let status: String
    let color: UIColor
}


//extension UIColor {
//    @nonobjc class var myBlue: UIColor {
//        return UIColor(red: 47.0 / 255.0, green: 128.0 / 255.0, blue: 237.0 / 255.0, alpha: 1)
//    }
//    @nonobjc class var myYellow: UIColor {
//        return UIColor(red: 255.0 / 255.0, green: 241 / 255.0, blue: 165 / 255.0, alpha: 1)
//    }
//    @nonobjc class var myLightBlue: UIColor {
//        return UIColor(red: 235.0 / 255.0, green: 241.0 / 255.0, blue: 250.0 / 255.0, alpha: 1)
//    }
//    @nonobjc class var myPurple: UIColor {
//        return UIColor(red: 248.0 / 255.0, green: 232.0 / 255.0, blue: 255.0 / 255.0, alpha: 1)
//    }
//    @nonobjc class var myRed: UIColor {
//        return UIColor(red: 255.0 / 255.0, green: 223.0 / 255.0, blue: 223.0 / 255.0, alpha: 1)
//    }
//    @nonobjc class var myGrey: UIColor {
//        return UIColor(red: 242.0 / 255.0, green: 242.0 / 255.0, blue: 242.0 / 255.0, alpha: 1)
//    }
//}
