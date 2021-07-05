//
//  TransferNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Moya

public class TransferNetworkmanagerImpl: TransferNetworkManager {
    
    public init() {}
    
    public func transfer(receiver: Int, amount: Int, notes: String, pin: String, completion: @escaping (TransferResponse?, Error?) -> ()) {
        let provider = MoyaProvider<TransferApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))], isRefreshToken: true)
        
        provider.request(.postTransfer(receiver: receiver, amount: amount, notes: notes, pin: pin)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let transferResponse = try decoder.decode(TransferResponse.self, from: result.data)
                    completion(transferResponse, nil)
                }catch let error {
                    completion(nil, error)
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
