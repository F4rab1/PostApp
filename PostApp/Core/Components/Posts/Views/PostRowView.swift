//
//  PostRowView.swift
//  PostApp
//
//  Created by Фараби Иса on 02.01.2023.
//

import SwiftUI
import Kingfisher

struct PostRowView: View {
    @ObservedObject var viewModel: PostRowViewModel
    
    init(post: Post) {
        self.viewModel = PostRowViewModel(post: post)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top, spacing: 15) {
                
                if let user = viewModel.post.user {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)

                    
                    VStack(alignment: .leading, spacing: 4) {
                            
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                                    
                            Text("@\(user.username)")
                                .font(.caption)
                                .foregroundColor(.gray)
                                     
                            Text("2w")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                            
                        Text(viewModel.post.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                Spacer()
                
                Button {
                    viewModel.post.didLike ?? false ? viewModel.unlikePost() : viewModel.likePost()
                } label: {
                    Image(systemName: viewModel.post.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.post.didLike ?? false ? .red : .gray)
                }

                
            }
            
            Divider()

        }
        .padding()
            
        
    }
}

//struct PostRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostRowView()
//    }
//}
