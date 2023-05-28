//
//  CatDetailView.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-28.
//

import SwiftUI

struct CatDetailView: View {
    var catModel: CatBreedElement //pass it as a binding if there is  a need to update state inside this detail view
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .center, spacing: 8) {
                    RoundedImage()
                    Text(catModel.altNames ?? "")
                        .font(.title)
                    HStack {
                        Text("Affection level: \(catModel.affectionLevel)")
                        Spacer()
                        Text("Grooming: \(catModel.grooming)")
                    }.font(.title3)
                }
                .padding()
                Spacer()
            }
        }
        .navigationTitle(catModel.name)
        .navigationBarTitleDisplayMode(.large)
    }
}
//
//struct CatDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CatDetailView()
//    }
//}
