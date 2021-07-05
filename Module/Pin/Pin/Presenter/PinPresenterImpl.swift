//
//  PinPresenterImpl.swift
//  Pin
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public class PinPresenterImpl: PinPresenter {
    
    let interactor: PinInteractor?
    let router: PinRouter
    
    init(interactor: PinInteractor, router: PinRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func setPin(pin: String) {
        interactor?.postPin(pin: pin)
    }
}

extension PinPresenterImpl: PinInteractorOutput {
    func authenticate(isSuccess: Bool) {
        if isSuccess {
            router.navigateToHome()
        }else {
            print("failure or bad request")
        }
    }
}
