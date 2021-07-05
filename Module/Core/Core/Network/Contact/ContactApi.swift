//
//  ContactApi.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public enum ContactApi {
    case getContact
}

extension ContactApi: TargetType {
    
    public var path: String {
        switch self {
        case .getContact:
            return "/tranfer/contactUser"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getContact:
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
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return ["Content-Type": "application/json", "Authorization" : "Bearer \(token)"]
    }

}
