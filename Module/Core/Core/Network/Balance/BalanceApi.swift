//
//  BalanceApi.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public enum BalanceApi {
    case getBalance
    case patchProfile(username: String, firstname: String, lastname: String, email: String, phone: String)
}

extension BalanceApi: TargetType {
    public var path: String {
        switch self {
        case .getBalance:
            return "/home/getBalance"
        case .patchProfile:
            return "/user/changeInfo"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getBalance:
            return .requestPlain
        case .patchProfile(let username, let firstname, let lastname, let email, let phone):
            return .requestParameters(parameters: ["username": username, "fisrtname": firstname, "lastname": lastname, "email": email, "phone": phone], encoding: JSONEncoding.default)
        }
    }
    
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var method: Moya.Method {
        switch self {
        case .getBalance:
            return .get
        case .patchProfile:
            return .patch
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return ["Content-Type": "application/json", "Authorization" : "Bearer \(token)"]
    }

}
