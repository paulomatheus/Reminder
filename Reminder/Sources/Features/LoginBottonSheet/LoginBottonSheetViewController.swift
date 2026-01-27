//
//  LoginBottonSheetViewController.swift
//  Reminder
//
//  Created by Paulo Matheus on 26/01/26.
//

import Foundation
import UIKit

class LoginBottonSheetViewController: UIViewController {
    
    let loginView = LoginBottomSheetView()
    var handlerAreaHeight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGesture()
    }
    
    private func setupUI(){
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupGesture(){
        
    }
    
    private func handlePanGesture(){
        
    }
    
    func animateShow(completion: (() -> Void)? = nil){
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: self.loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }


}
