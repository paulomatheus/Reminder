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
        //let startViewController = MyReceiptsViewController(contentView: MyReceiptsView())
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}
//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        navigationController?.dismiss(animated: true)
        let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
        
        func navigateToHome() {
            self.navigationController?.dismiss(animated: true)
            let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: -Home
extension ReminderFlowController: HomeFlowDelegate {
    func logout(){
        self.navigationController?.popViewController(animated: true)
        self.openLoginBottomSheet()
    }
    func navigateToMyRecipes() {
        let myReceiptsViewController = viewControllerFactory.makeMyReceiptsViewController(flowDelegate: self)
        self.navigationController?.pushViewController(myReceiptsViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func navigateToRecipes(){
        let recipesViewController = viewControllerFactory.makeReceiptViewController()
        self.navigationController?.pushViewController(recipesViewController, animated: true)        
        self.navigationController?.navigationBar.isHidden = true
    }
}

//MARK: - MyReceipts

extension ReminderFlowController: MyReceiptsFlowDelegate {
    func goToNewReceipts() {
        
    }
}
