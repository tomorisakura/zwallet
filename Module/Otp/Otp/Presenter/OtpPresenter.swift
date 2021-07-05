//
//  OtpPresenter.swift
//  Otp
//
//  Created by MacBook on 27/05/21.
//

import Foundation

protocol OtpPresenter {
    func otp(email: String, code: String)
    func getEmail() -> String
    func showLogin()
    func showPin()
}
