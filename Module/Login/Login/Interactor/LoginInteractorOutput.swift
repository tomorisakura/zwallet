//
//  LoginInteractorOutput.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation

protocol LoginIntercatorOutput {
    func authenticationResult(isSuccess: Bool, status: Int)
}
