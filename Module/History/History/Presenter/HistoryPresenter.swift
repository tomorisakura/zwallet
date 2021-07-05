//
//  HomePresenter.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit

protocol HistoryPresenter {
    func loadThisWeekHistory()
    func loadTransaction()
    func showHome(viewController: UIViewController)
}
