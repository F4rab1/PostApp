//
//  UploadPostViewModel.swift
//  PostApp
//
//  Created by Фараби Иса on 09.02.2023.
//

import Foundation

class UploadPostViewModel: ObservableObject {
    @Published var didUploadPost = false
    let service = PostService()
    
    func uploadPost(withCaption caption: String) {
        service.uploadPost(caption: caption) { success in
            if success {
                //dismiss view
                self.didUploadPost = true
            } else {
                //show error
            }
        }
    }
}
