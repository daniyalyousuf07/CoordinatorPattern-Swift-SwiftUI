//
//  RoundedImage.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-28.
//

import SwiftUI

struct RoundedImage: View {
    var body: some View {
        Image("cat")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 1)
            }
            .shadow(radius: 10)
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage()
    }
}
