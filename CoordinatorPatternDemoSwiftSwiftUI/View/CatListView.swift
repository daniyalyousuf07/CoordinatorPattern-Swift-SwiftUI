//
//  CatListView.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-28.
//

import SwiftUI

struct CatListView: View {
    @ObservedObject var model: CatListViewModel
    var moveToDetail: (CatBreedElement) -> ()
    var body: some View {
        NavigationView {
            List {
                ForEach(model.catList, id: \.id) { cat in
                    Text(cat.name)
                        .onTapGesture {
                            moveToDetail(cat)
                        }
                }.onDelete { indexSet in
                    model.itemRemoved?(model.catList[indexSet.first!])
                    model.removeCat(atOffsets: indexSet)
                }
            }
            .navigationTitle("Cats")
            .listStyle(.inset)
            .navigationBarBackButtonHidden()
        }
        
    }
}

struct CatListView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView(model: .init(), moveToDetail: {_ in })
    }
}

