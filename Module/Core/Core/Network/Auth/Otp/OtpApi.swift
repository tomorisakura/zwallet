//
//  OtpApi.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public enum OtpApi {
    case otp(email: String, code: String)
}

extension OtpApi: TargetType {
    
    public var path: String {
        switch self {
        case .otp(let email, let code):
            return "/auth/activate/\(email)/\(code)"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .otp:
            return .requestPlain
        }
    }
    
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
