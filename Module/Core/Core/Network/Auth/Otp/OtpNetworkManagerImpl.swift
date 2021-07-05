//
//  OtpNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public class OtpNetworkManagerImpl: OtpNetworkManager {
    
    public init() {
        
    }
    
    public func otp(email: String, code: String, completion: @escaping (OtpResponse?, Error?) -> ()) {
        let provider = MoyaProvider<OtpApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        
        provider.request(.otp(email: email, code: code)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let otpResponse = try decoder.decode(OtpResponse.self, from: result.data)
                    completion(otpResponse, nil)
                }catch let error {
                    completion(nil, error)
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
