//
//  RegisterApi.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Moya

public enum RegisterApi {
    case register(username: String, email: String, password: String)
}

extension RegisterApi: TargetType {
    public var path: String {
        switch self {
        case .register:
            return "/auth/signup"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .register(let username, let email, let password):
            return .requestParameters(parameters: ["username": username, "email": email, "password":password], encoding: JSONEncoding.default)
        }
    }
    
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
