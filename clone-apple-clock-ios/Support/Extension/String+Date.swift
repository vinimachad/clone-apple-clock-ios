//
//  Date.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 17/02/22.
//

import Foundation

extension Date {
    
    static var rawDateFormat: String =  "yyyy-MM-dd"
    static var defaultDateFormat: String  = "dd/MM/yyyy"
    static var dateDescriptionFormat: String  = "dd MMMM yyyy"
    static var defaultTimeFormat: String  = "HH:mm"
    static var dayMonthFormat: String  = "dd/MM"
    static var monthYearFormat: String  = "MM/yy"
    static var dayTimeFormat: String = "dd/MM/yyyy, HH:mm"
    static var fullFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZZZ"
    
    func toString(format: String = Date.defaultDateFormat, timeZone: TimeZone = .current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        return dateFormatter.string(from: self)
    }
}

extension String {
    
    func toDate(format: String = Date.defaultTimeFormat) -> Date? {
        let parseFormat = DateFormatter()
        parseFormat.timeZone = TimeZone.current
        parseFormat.locale = Locale.current
        parseFormat.dateFormat = format
        return parseFormat.date(from: self)
    }
}
