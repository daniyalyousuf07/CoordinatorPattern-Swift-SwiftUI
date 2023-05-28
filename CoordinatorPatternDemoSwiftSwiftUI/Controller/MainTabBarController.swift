//
//  MainTabBarController.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-27.
//

import UIKit

final class MainTabBarController: UITabBarController {
    private var swiftCatListing: SwiftCatListingCoordinator!
    private var swiftUICatListing: SwiftUICatListingCoordinator!
    private let sharedViewModel = CatListViewModel() //Shared Model <- if coming from parent controller do inject and pass here
    override func viewDidLoad() {
        super.viewDidLoad()
        swiftCatListing = .init(navigationController: .init(),
                                viewModel: sharedViewModel)
        swiftUICatListing = .init(navigationController: .init(),
                                  viewModel: sharedViewModel)
        swiftCatListing.start()
        swiftUICatListing.start()
        viewControllers = [swiftCatListing.navigationController,
                           swiftUICatListing.navigationController]
    }
}
