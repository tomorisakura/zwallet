//
//  MoyaExtension.swift
//  Core
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Moya

extension MoyaProvider {
    
    static func endpointResolver() -> MoyaProvider<Target>.RequestClosure {
        return { (endpoint, closure) in
            // get ori request
            let request = try! endpoint.urlRequest()
            
            // assume have the existring token somewhere
            let tokenExpiredDate: Date? = UserDefaultHelper.shared.get(key: .userTokenExpired)
            if tokenExpiredDate ?? Date() > Date() {
                closure(.success(request))
                return
            }
            
            let email: String = UserDefaultHelper.shared.get(key: .email) ?? ""
            let refreshToken: String = UserDefaultHelper.shared.get(key: .refreshToken) ?? ""
            let authManager = AuthNetworkManagerImpl()
            authManager.refreshToken(email: email, refreshToken: refreshToken) { (result, error) in
                if let refreshTokenResult = result {
                    UserDefaultHelper.shared.set(key: .userToken, value: refreshTokenResult.token)
                    
                    let currendDate: Date = Date()
                    // change 10 with expired in object API
                    let tokenExpiredAt: Date = Calendar.current.date(byAdding: .second, value: refreshTokenResult.expiredIn / 1000, to: currendDate)!
                    UserDefaultHelper.shared.set(key: .userTokenExpired, value: tokenExpiredAt)
                    
                    let newEndpoint = endpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer \(refreshTokenResult.token)"])
                    let finalRequest = try! newEndpoint.urlRequest()
                    closure(.success(finalRequest))
                } else {
                    UserDefaultHelper.shared.remove(key: .userToken)
                    UserDefaultHelper.shared.remove(key: .userTokenExpired)
                    UserDefaultHelper.shared.remove(key: .userToken)
                    NotificationCenter.default.post(name: Notification.Name("ReloadRootView"), object: nil)
                }
            }
        }
    }
}

extension MoyaProvider {
    convenience init(plugins: [PluginType], isRefreshToken: Bool) {
        if isRefreshToken {
            self.init(requestClosure: MoyaProvider.endpointResolver(), plugins: plugins)
        } else {
            self.init(plugins: plugins)
        }
    }
}
