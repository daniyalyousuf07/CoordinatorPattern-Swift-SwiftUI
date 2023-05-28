//
//  CatListViewModel.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-28.
//

import Foundation

final class CatListViewModel: ObservableObject {
    
    @Published var catList = [CatBreedElement]()
    var itemRemoved: ((CatBreedElement) -> Void)? = nil
  
    init() {
        if let  data = fetchCatList() {
            catList = data
        }
    }
    
    private func fetchCatList() -> [CatBreedElement]? {
        let result = readLocalJSONFile(forName: "CatBreedData")
        if case let .success(data)  = result {
            let result: Result<[CatBreedElement], JSONErrors> = parse(jsonData: data)
            if case let .success(catList) = result {
                return catList
            }
        }
        return nil
    }
    
    func removeCat(atOffsets: IndexSet) {
        catList.remove(atOffsets: atOffsets)
    }
    
    func removeCat(indexPath: IndexPath) {
        catList.remove(at: indexPath.row)
    }
}
