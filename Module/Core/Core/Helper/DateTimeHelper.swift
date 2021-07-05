//
//  DateTimeHelper.swift
//  Core
//
//  Created by MacBook on 29/05/21.
//

import Foundation

public class DateTimeHelper {
    public static var shared: DateTimeHelper = DateTimeHelper()
    
    public func generateCurrentDateTime() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dateFormatter.locale = Locale(identifier: "id_ID")
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    public func generateTimeNow() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "id_ID")
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
