//
//  RegisterNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Moya

public class RegisterNetworkManagerImpl: RegisterNetworkManager {
    
    public init() {
        
    }
    
    public func register(username: String, email: String, password: String, completion: @escaping (RegisterDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<RegisterApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        provider.request(.register(username: username, email: email, password: password)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let registerResponse = try decoder.decode(RegisterDataResponse.self, from: result.data)
                    completion(registerResponse, nil)
                }catch let error {
                    completion(nil, error)
                }
                
            case .failure(let error):
                completion(nil, error)
                
            }
        }
    }
}
