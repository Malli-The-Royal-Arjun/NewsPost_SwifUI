//
//  Extension+Date.swift
//  Inspire Challenge
//
//  Created by Mupparaju Rao on 24/10/23.
//

import Foundation

extension DateFormatter {
    
    convenience init (format: String) {
        self.init()
        dateFormat = format
        locale = Locale.current
    }
}

extension Date {
    
    func toString (dateFormatter: DateFormatter) -> String? {
        return dateFormatter.string(from: self)
    }
}
