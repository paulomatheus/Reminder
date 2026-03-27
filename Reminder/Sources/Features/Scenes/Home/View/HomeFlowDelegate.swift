//
//  HomeViewDelegate.swift
//  Reminder
//
//  Created by Paulo Matheus on 24/03/26.
//

import Foundation

protocol HomeFlowDelegate: AnyObject {
    init(content: HomeView, flowDelegate: HomeFlowDelegate)
}



