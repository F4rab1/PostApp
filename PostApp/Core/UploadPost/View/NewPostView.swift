//
//  NewPostView.swift
//  PostApp
//
//  Created by Фараби Иса on 03.01.2023.
//

import SwiftUI
import Kingfisher

struct NewPostView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button {
                    viewModel.uploadPost(withCaption: caption)
                } label: {
                    Text("Post")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundColor(Color(.white))
                        .background(Color(.systemMint))
                        .clipShape(Capsule())
                }

            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
            
                TextArea("What's happening?", text: $caption)
            }
            .padding()
            
        }
        .onReceive(viewModel.$didUploadPost ) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
