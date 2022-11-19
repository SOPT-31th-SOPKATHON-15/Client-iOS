//
//  CombineCompatible.swift
//  Core
//
//  Created by Junho Lee on 2022/10/27.
//  Copyright © 2022 SOPT-Stamp-iOS. All rights reserved.
//

import Combine

public protocol CombineCompatible { }


//
//  UIColor+.swift
//  31-SOPKATHON-iOS
//
//  Created by 고두영 on 2022/11/20.
//

import UIKit

extension UIColor {
    @nonobjc class var myBlue: UIColor {
        return UIColor(red: 47.0 / 255.0, green: 128.0 / 255.0, blue: 237.0 / 255.0, alpha: 1)
    }
    @nonobjc class var myYellow: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 241 / 255.0, blue: 165 / 255.0, alpha: 1)
    }
    @nonobjc class var myLightBlue: UIColor {
        return UIColor(red: 235.0 / 255.0, green: 241.0 / 255.0, blue: 250.0 / 255.0, alpha: 1)
    }
    @nonobjc class var myPurple: UIColor {
        return UIColor(red: 248.0 / 255.0, green: 232.0 / 255.0, blue: 255.0 / 255.0, alpha: 1)
    }
    @nonobjc class var myRed: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 223.0 / 255.0, blue: 223.0 / 255.0, alpha: 1)
    }
    @nonobjc class var myGrey: UIColor {
        return UIColor(red: 242.0 / 255.0, green: 242.0 / 255.0, blue: 242.0 / 255.0, alpha: 1)
    }
}
