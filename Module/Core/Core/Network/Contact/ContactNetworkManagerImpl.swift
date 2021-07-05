//
//  ContactNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public class ContactNetworkManagerImpl: ContactNetworkManager {
    
    public init() {}
    
    public func getContact(completion: @escaping (ContactResponse?, Error?) -> ()) {
        let provider = MoyaProvider<ContactApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        provider.request(.getContact) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getContactResponse = try decoder.decode(ContactResponse.self, from: result.data)
                    completion(getContactResponse, nil)
                }catch let error {
                    completion(nil, error)
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
