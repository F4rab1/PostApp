//
//  ProfilePhotoSelectorView.swift
//  PostApp
//
//  Created by Фараби Иса on 06.02.2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title: "Add a profile photo")
            
            Button {
                print("Pick image here..")
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                } else {
                    Image("addProfile")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemMint))
                        
                }
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .modifier(ProfileImageModifier())
            
            Spacer()
            
            if let selectedImage = selectedImage {
                Button {
                    print("DEBUD: Finish registering user..")
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemMint))
                        .clipShape(Capsule())
                        .padding(.bottom, 80)
                }
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 0)
            }
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 90)
                    .stroke((Color(.systemMint)))
            )
            .clipShape(Circle())
            .padding(.top, 44)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
