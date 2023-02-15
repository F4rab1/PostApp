//
//  FeedView.swift
//  PostApp
//
//  Created by Фараби Иса on 02.01.2023.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewPostView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        PostRowView(post: post)
                    }
                }
            }
            
            Button {
                showNewPostView.toggle()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemMint))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewPostView) {
                NewPostView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
