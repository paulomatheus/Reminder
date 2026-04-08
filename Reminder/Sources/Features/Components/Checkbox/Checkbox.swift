//
//  Checkbox.swift
//  Reminder
//
//  Created by Paulo Matheus on 08/04/26.
//

import Foundation
import UIKit

class Checkbox: UIView {
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.font = Typography.input
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkbox: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = Colors.gray400
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        titlelabel.text = title
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titlelabel)
        addSubview(checkbox)
        setupConstrains()
        
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: 24),
            checkbox.heightAnchor.constraint(equalToConstant: 24),
            
            titlelabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: Metrics.small),
            titlelabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titlelabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
