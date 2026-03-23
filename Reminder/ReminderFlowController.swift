//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Paulo Matheus on 18/03/26.
//
//MVVM-C - Model View ViewModel - Coordinator

import Foundation
import UIKit

class ReminderFlowController {
    //MARK: - Properties
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol

    //MARK: - Init
    public init() {
        self.viewControllerFactory = ViewControllerFactory()
    }
    
    //MARK: - StarFlow
    func start() -> UINavigationController? {
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}
//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true, completion: nil)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
    
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true, completion: nil)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
