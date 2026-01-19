//
//  LaunchViewController.swift
//  Reminder
//
//  Created by Paulo Matheus on 19/01/26.
//

import Foundation
import UIKit

class LaunchViewController: UIViewController {
    let contentView = LaunchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        contentView.topAnchor.constraint(equalTo: view.topAnchor),
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
    }

}

