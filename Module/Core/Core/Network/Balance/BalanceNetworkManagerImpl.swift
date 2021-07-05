//
//  BalanceNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public class BalanceNetworkManagerImpl: BalanceNetworkManager {
    public init() {
        
    }
    
    public func getBalance(completion: @escaping (GetBalanceDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<BalanceApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))], isRefreshToken: true)
        provider.request(.getBalance) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getBalanceResponse = try decoder.decode(GetBalanceResponse.self, from: result.data)
                    completion(getBalanceResponse.data[0], nil)
                }catch let error {
                    completion(nil, error)
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func patchProfilePhone(username: String, firstname: String, lastname: String, email: String, phone: String, completion: @escaping (GetBalanceDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<BalanceApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))], isRefreshToken: true)
        provider.request(.patchProfile(username: username, firstname: firstname, lastname: lastname, email: email, phone: phone)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getBalanceResponse = try decoder.decode(GetBalanceResponse.self, from: result.data)
                    completion(getBalanceResponse.data[0], nil)
                }catch let error {
                    completion(nil, error)
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
