//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Paulo Matheus on 11/03/26.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
