//
//  PinApi.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public enum PinApi {
    case authenticatePin(pin: String)
    case checkPin(pin: String)
}

extension PinApi: TargetType {
    public var path: String {
        switch self {
        case .authenticatePin:
            return "/auth/PIN"
        case .checkPin(let pin):
            return "/auth/checkPIN/\(pin)"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .authenticatePin(let pin):
            return .requestParameters(parameters: ["PIN": pin], encoding: JSONEncoding.default)
        case .checkPin:
            return .requestPlain
        }
    }
    
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var method: Moya.Method {
        switch self {
        case .checkPin:
            return .get
        default:
            return .patch
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return ["Content-Type": "application/json", "Authorization" : "Bearer \(token)"]
    }
}
