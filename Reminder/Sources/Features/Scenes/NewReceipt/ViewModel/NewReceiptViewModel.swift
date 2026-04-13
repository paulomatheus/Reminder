//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by Paulo Matheus on 13/04/26.
//

import Foundation

class NewReceiptViewModel {
    func addReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool){
        DBHelper.shared.insertReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
    }
}
