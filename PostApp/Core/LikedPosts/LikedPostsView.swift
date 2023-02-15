//
//  LikedPostsView.swift
//  PostApp
//
//  Created by Фараби Иса on 03.01.2023.
//

import SwiftUI

struct LikedPostsView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0 ... 20, id: \.self) { _ in
//                    PostRowView()
                }
            }
        }
    }
}

struct LikedPostsView_Previews: PreviewProvider {
    static var previews: some View {
        LikedPostsView()
    }
}
