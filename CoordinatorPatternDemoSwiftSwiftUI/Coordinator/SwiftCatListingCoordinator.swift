//
//  Swift_Cat_Listing.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-27.
//

import UIKit

final class SwiftCatListingCoordinator: NSObject, Coordinator  {
   var childCoordinator = [Coordinator]()
    
    var catListViewModel: CatListViewModel
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, viewModel: CatListViewModel) {
        self.navigationController = navigationController
        catListViewModel = viewModel
    }
    
    func start() {
        navigationController.delegate = self
        let vc = SwiftCatListingViewController.instantiate()
        vc.tabBarItem = .init(title: "SwiftListing", image: .init(systemName: "folder"), tag: 0)
        vc.coordinator = self
        vc.catListViewModel = catListViewModel
        navigationController.pushViewController(vc,
                                                animated: true)
    }
}

extension SwiftCatListingCoordinator:  UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let catListController = fromViewController as? SwiftCatListingViewController, let coordinator = catListController.coordinator {
            childDidFinish(coordinator)
        }
    }
}
