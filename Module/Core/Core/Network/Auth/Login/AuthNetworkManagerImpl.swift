//
//  AuthNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public class AuthNetworkManagerImpl: AuthNetworkManager {
    public init() {
    }
    
    public func login(email: String, password: String, completion: @escaping (LoginResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        provider.request(.login(email: email, password: password)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let loginResponse = try decoder.decode(LoginResponse.self, from: result.data)
                    completion(loginResponse, nil)
                }catch let error {
                    completion(nil, error)
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func refreshToken(email: String, refreshToken: String, completion: @escaping (RefreshTokenDataResponse?, Error?) -> ()) {
            let provider = MoyaProvider<AuthApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
            provider.request(.refreshToken(email: email, refreshToken: refreshToken)) { response in
                switch response {
                case .success(let result):
                    let decoder = JSONDecoder()
                    do {
                        let refreshTokenResponse = try decoder.decode(RefreshTokenResponse.self, from: result.data) as RefreshTokenResponse
                        completion(refreshTokenResponse.data, nil)
                    } catch let error {
                        completion(nil, error)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    
}

