//
//  FeedViewModel.swift
//  PostApp
//
//  Created by Фараби Иса on 09.02.2023.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    let service = PostService()
    let userService = UserService()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        service.fetchPosts { posts in
            self.posts = posts
            
            for index in 0 ..< posts.count {
                let uid = posts[index].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.posts[index].user = user
                }
            }
        }
    }
}
