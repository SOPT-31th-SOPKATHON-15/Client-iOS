//
//  AlertService.swift
//  Network
//
//  Created by Junho Lee on 2022/10/16.
//  Copyright © 2022 SOPT-Stamp-iOS. All rights reserved.
//

import Foundation


import Alamofire
import Moya

typealias DefaultAlertService = BaseService<AlertAPI>



protocol AlertService {
    func fetchListDetail(productId: Int, completion: @escaping (Result<[ListDetailModel], Error>) -> Void)
    func addProduct(productName: String, price: Int, contents: String, completion: @escaping (Result<AddProductModel?, Error>) -> Void)
    func fetchProductList(year: Int, month: Int, completion: @escaping (Result<ProductListModel?, Error>) -> Void)
    func fetchHomeList(completion: @escaping (Result<HomeModel?, Error>) -> Void)
}

extension DefaultAlertService: AlertService {
    func fetchProductList(year: Int, month: Int, completion: @escaping (Result<ProductListModel?, Error>) -> Void) {
        requestObject(.fetchProductList(year: year, month: month), completion: completion)
    }
    
    func addProduct(productName: String, price: Int, contents: String, completion: @escaping (Result<AddProductModel?, Error>) -> Void) {
        requestObject(.postProducct(productName: productName, price: price, contents: contents), completion: completion)
    }
    
    func fetchListDetail(productId: Int, completion: @escaping (Result<[ListDetailModel], Error>) -> Void) {
        requestArray(.listDetailFetch(productId: productId), completion: completion)
    }
    
    func fetchHomeList(completion: @escaping (Result<HomeModel?, Error>) -> Void) {
        requestObject(.fetchHomeList, completion: completion)
    }
}
