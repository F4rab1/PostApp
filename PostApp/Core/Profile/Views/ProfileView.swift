//
//  ProfileView.swift
//  PostApp
//
//  Created by Фараби Иса on 02.01.2023.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFiler: PostFilterViewModel = .posts
    @ObservedObject var viewModel: ProfileViewModel
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            
            headerView
            
            Divider()
            
            userInfoDetails
            
            postFilterBar
            
            postsView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "Test",
                               fullname: "Test fullname",
                               profileImageUrl: "",
                               email: "test@gmail.com"))
    }
}

extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemMint)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .offset(x: 5, y: -4)
                }
                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var userInfoDetails: some View {
        VStack(spacing: 4) {
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
        }
        .padding()
    }
    
    var postFilterBar: some View {
        HStack {
            ForEach(PostFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFiler == item ? .semibold : .regular)
                        .foregroundColor(selectedFiler == item ? .black : .gray)
                    
                    if selectedFiler == item {
                        Capsule()
                            .foregroundColor(Color(.black))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFiler = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var postsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts(forFilter: self.selectedFiler)) { post in
                    PostRowView(post: post)
                        .padding(5)
                }
            }
        }
    }
    
}
