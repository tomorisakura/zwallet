//
//  PinNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public class PinNetworkManagerImpl: PinNetworkManager {
    
    public init() {
    }
    
    public func authenticatePin(pin: String, completion: @escaping (PinDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<PinApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        provider.request(.authenticatePin(pin: pin)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let pinResponse = try decoder.decode(PinDataResponse.self, from: result.data)
                    completion(pinResponse, nil)
                }catch let error {
                    completion(nil, error)
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func checkPin(pin: String, completion: @escaping (PinDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<PinApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))], isRefreshToken: true)
        provider.request(.checkPin(pin: pin)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let pinResponse = try decoder.decode(PinDataResponse.self, from: result.data)
                    completion(pinResponse, nil)
                }catch let error {
                    completion(nil, error)
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
