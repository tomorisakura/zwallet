//
//  TransferApi.swift
//  Core
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Moya

public enum TransferApi {
    case postTransfer(receiver: Int, amount: Int, notes: String, pin: String)
}

extension TransferApi: TargetType {
    
    public var path: String {
        switch self {
        case .postTransfer:
            return "/tranfer/newTranfer"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .postTransfer(let receiver, let amount, let notes, _):
            return .requestParameters(parameters: ["receiver": receiver, "amount":amount, "notes": notes], encoding: JSONEncoding.default)
        }
    }
    
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .postTransfer(_ , _, _, let pin):
            return ["Content-Type": "application/json", "Authorization" : "Bearer \(token)", "x-access-pin": pin]
        }
    }

}
