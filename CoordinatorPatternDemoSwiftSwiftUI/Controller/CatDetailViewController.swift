//
//  CatDetailViewController.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-28.
//

import UIKit
import SwiftUI

final class CatDetailViewController: UIHostingController<CatDetailView> {
    weak var coordinator: SwiftUICatListingCoordinator?
    var model: CatListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}
