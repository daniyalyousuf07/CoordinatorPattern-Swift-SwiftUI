//
//  SwiftUI_Cat_Listing.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-27.
//

import UIKit
import  SwiftUI

final class SwiftUICatListingCoordinator: NSObject, Coordinator  {
    var childCoordinator = [Coordinator]()
   
    var catListViewModel: CatListViewModel?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, viewModel: CatListViewModel) {
        self.navigationController = navigationController
        catListViewModel = viewModel
    }
    
    func start() {
        navigationController.delegate = self
        let vc = SwiftUICatListingViewController(rootView: CatListView(model: catListViewModel!, moveToDetail: { [weak self] cat in
            let detailVC = CatDetailViewController(rootView: CatDetailView(catModel: cat))
            self?.navigationController.navigationBar.isHidden = false
            self?.navigationController.pushViewController(detailVC, animated: true)
        })) //Shared Model can be passed as an environment object too.
        vc.tabBarItem = .init(title: "SwiftUIListing",
                              image: .init(systemName: "paperplane"), tag: 1)
        vc.coordinator = self
        vc.model = catListViewModel
        navigationController.pushViewController(vc,
                                                animated: true)
    }
}

extension SwiftUICatListingCoordinator:  UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let catListController = fromViewController as? SwiftUICatListingViewController, let coordinator = catListController.coordinator {
            childDidFinish(coordinator)
        }
    }
}
