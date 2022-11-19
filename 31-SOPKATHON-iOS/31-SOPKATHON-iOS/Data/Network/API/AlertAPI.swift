//
//  AlertAPI.swift
//  Network
//
//  Created by Junho Lee on 2022/10/16.
//  Copyright © 2022 SOPT-Stamp-iOS. All rights reserved.
//

import Foundation

import Alamofire
import Moya

public enum AlertAPI {
    case fetchProductList(year: Int, month: Int)
    
    case fetchHomeList
    
    case postProducct(productName: String, price: Int, contents: String)
    
    case listDetailFetch(productId: Int)
}

extension AlertAPI: BaseAPI {
    
    public static var apiType: APIType = .alert
    
    // MARK: - Path
    public var path: String {
        switch self {
        case .fetchHomeList: return "home"
        case .postProducct: return "write"
        case .listDetailFetch: return "products"
        case .fetchProductList: return "product-list"
        default: return ""
        }
    }
    
    // MARK: - Method
    public var method: Moya.Method {
        switch self {
        case .postProducct:
            return .post
        default: return .get
        }
    }
    
    // MARK: - Parameters
    /// - note :
    ///  post를 할때, body Parameter를 담아서 전송해야하는 경우가 있는데,
    ///  이 경우에 사용하는 부분입니다.
    ///
    ///  (get에서는 사용 ❌, get의 경우에는 쿼리로)
    ///
    private var bodyParameters: Parameters? {
        var params: Parameters = [:]
        switch self {
        case .listDetailFetch(let id):
            params["productId"] = id
        case .postProducct(let productName, let price, let content) :
            params["productName"] = productName
            params["price"] = price
            params["contents"] = content
        case .fetchProductList(let year, let month):
            params["year"] = year
            params["month"] = month
        default: return nil
        }
        return params
    }
    
    /// - note :
    ///  query문을 사용하는 경우 URLEncoding 을 사용해야 합니다
    ///  나머지는 그냥 전부 다 default 처리.
    ///
    private var parameterEncoding: ParameterEncoding {
        switch self {
        case .postProducct:
            return URLEncoding.init(destination: .httpBody, arrayEncoding: .brackets, boolEncoding: .literal)
        case .listDetailFetch, .fetchProductList:
            return URLEncoding.init(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .literal)
        default:
            return JSONEncoding.default
        }
    }
    
    /// - note :
    ///  body Parameters가 있는 경우 requestParameters  case 처리.
    ///  일반적인 처리는 모두 requestPlain으로 사용.
    ///
    public var task: Task {
        switch self {
        case .postProducct( _, _, _):
            var params: Parameters = [:]
            params["userId"] = 1
            return .requestCompositeParameters(bodyParameters: bodyParameters ?? [:], bodyEncoding: parameterEncoding, urlParameters: params)
        default:
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .fetchHomeList:
            let entity = 200
            if let data = try? JSONEncoder().encode(entity) {
                return data
            } else {
                return Data()
            }
        case .listDetailFetch(let _):
            let entity = 200
            if let data = try? JSONEncoder().encode(entity) {
                return data
            } else {
                return Data()
            }
        case .postProducct:
            let entity = 200
            if let data = try? JSONEncoder().encode(entity) {
                return data
            } else {
                return Data()
            }
        case .fetchProductList(year: let year, month: let month):
            let entity = 200
            if let data = try? JSONEncoder().encode(entity) {
                return data
            } else {
                return Data()
            }
        }
    }
}
