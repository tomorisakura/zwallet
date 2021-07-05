//
//  OtpInteractorOutput.swift
//  Otp
//
//  Created by MacBook on 27/05/21.
//

import Foundation

protocol OtpInteractorOutput {
    func authenticate(isSuccess: Bool, message: String?)
}
