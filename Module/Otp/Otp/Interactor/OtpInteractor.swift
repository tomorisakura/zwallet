//
//  OtpInteractor.swift
//  Otp
//
//  Created by MacBook on 27/05/21.
//

import Foundation

protocol OtpInteractor {
    func postOtpData(email: String, code: String)
    func getEmailShared() -> String
}
