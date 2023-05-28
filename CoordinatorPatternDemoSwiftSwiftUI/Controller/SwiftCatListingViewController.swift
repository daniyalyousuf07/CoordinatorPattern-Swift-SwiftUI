//
//  SwiftCatListingViewController.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-27.
//

import UIKit
import Combine


final class SwiftCatListingViewController: UIViewController {
    
    @IBOutlet weak private var  tableView: UITableView!
    
    private var snapshot = NSDiffableDataSourceSnapshot<ViewControllerSection, CatBreedElement>()
    private var cancellable = Set<AnyCancellable>()
    weak var coordinator: SwiftCatListingCoordinator?
    
    var catListViewModel: CatListViewModel!
    
    enum ViewControllerSection: CaseIterable {
        case main
    }
    
    private lazy var tableDataSource: UITableViewDiffableDataSource<ViewControllerSection, CatBreedElement> = {
        let dataSource = UITableViewDiffableDataSource<ViewControllerSection, CatBreedElement>(tableView: tableView) { tableView, indexPath, model in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CatListCell.id) as? CatListCell else {
                return .init()
            }
            cell.bindData(data: model)
            return cell
        }
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cats"
        configureDataSource()
        catListViewModel.itemRemoved = { [unowned self] item in
            snapshot.deleteItems([item])
            tableDataSource.apply(snapshot, animatingDifferences: false)
        }
    }
}

//MARK: - HELPER METHODS
extension SwiftCatListingViewController {
    private func configureDataSource() {
        snapshot.appendSections([.main])
        snapshot.appendItems(catListViewModel.catList, toSection: .main)
        tableDataSource.apply(snapshot, animatingDifferences: false)
    }
}

//MARK: - UITABLEVIEW DELEGATES
extension SwiftCatListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] action, view, handler in
            let item = catListViewModel.catList[indexPath.row]
            catListViewModel.removeCat(indexPath: indexPath)
            catListViewModel.itemRemoved?(item)
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}
