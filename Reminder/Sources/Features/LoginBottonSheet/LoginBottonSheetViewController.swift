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
    var bottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        setupUI()
        setupGesture()
        setupKeyboard()
        bindViewModel()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            bottomConstraint?.constant = -keyboardHeight
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        bottomConstraint?.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setupUI(){
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        bottomConstraint = loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            // loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), // Removed to use property
        ])
        bottomConstraint?.isActive = true
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
        heightConstraint.isActive = true
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutside))
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTapOutside() {
        self.view.endEditing(true)
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
