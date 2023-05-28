//
//  Coordinator.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-26.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
    func childDidFinish(_ child: Coordinator)
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if child === coordinator {
                childCoordinator.remove(at: index)
            }
        }
    }
}
