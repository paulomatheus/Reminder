//
//  LoginBottonSheetViewController.swift
//  Reminder
//
//  Created by Paulo Matheus on 26/01/26.
//

import Foundation
import UIKit

class LoginBottonSheetViewController: UIViewController {
    
    // The view class is declared as `LoginBottomSheetView` (correct spelling)
    // so instantiate that type here.
    let loginView = LoginBottomSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        self.view.addSubview(loginView)
    }

}
