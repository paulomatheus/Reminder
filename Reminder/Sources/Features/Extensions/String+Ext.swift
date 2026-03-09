//
//  String+File.swift
//  Reminder
//
//  Created by Paulo Matheus on 09/03/26.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
