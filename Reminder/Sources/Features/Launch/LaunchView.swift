//
//  LaunchView.swift
//  Reminder
//
//  Created by Paulo Matheus on 19/01/26.
//

import Foundation
import UIKit

class LaunchView: UIView {
    init(){
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .blue
        setupConstraints()
    }
    
    private func setupConstraints(){
        
    }
}
