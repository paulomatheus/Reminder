//
//  LoginBottonSheetViewController.swift
//  Reminder
//
//  Created by Paulo Matheus on 26/01/26.
//

import Foundation
import UIKit

class LoginBottonSheetViewController: UIViewController {
    var mainNavigation: UINavigationController?
    let loginView = LoginBottomSheetView()
    let viewModel = LoginBottomSheetViewModel()
    var handlerAreaHeight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
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
    
    private func bindViewModel(){
        viewModel.sucessResult = { [weak self] in
            let viewController = UIViewController()
            viewController.view.backgroundColor = .red
            self?.dismiss(animated: false)
            self?.mainNavigation?.pushViewController(viewController, animated: true)
        }
            
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

extension LoginBottonSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(usernameLogin: user, password: password)
    }
}
