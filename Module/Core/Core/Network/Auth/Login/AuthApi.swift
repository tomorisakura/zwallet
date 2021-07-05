//
//  AuthApi.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public enum AuthApi {
    case login(email: String, password: String)
    
    case refreshToken(email: String, refreshToken: String)
}

extension AuthApi: TargetType {
    public var path: String {
        switch self {
        case .login:
            return "/auth/login"
            
        case .refreshToken:
            return "/auth/refresh-token"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password":password], encoding: JSONEncoding.default)
            
        case .refreshToken(let email, let refreshToken):
            return .requestParameters(parameters: ["email": email, "refreshToken":refreshToken], encoding: JSONEncoding.default)
        }
    }
    
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var headers: [String : String]? {
        let token = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .refreshToken:
            return ["Content-Type": "application/json", "Authorization": "bearer \(token)"]
            
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
