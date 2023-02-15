//
//  ProfileViewModel.swift
//  PostApp
//
//  Created by Фараби Иса on 09.02.2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var likedPosts = [Post]()
    private let service = PostService()
    private let userService = UserService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserPosts()
        self.fetchLikedPosts()
    }
    
    func posts(forFilter filter: PostFilterViewModel) -> [Post] {
        switch filter {
            case .posts:
                return posts
            case .likes:
                return likedPosts
        }
    }
    
    func fetchUserPosts() {
        guard let uid = user.id else { return }
        
        service.fetchPosts(forUid: uid) { posts in
            self.posts = posts
            
            for index in 0 ..< posts.count {
                self.posts[index].user = self.user
            }
        }
    }
    
    func fetchLikedPosts() {
        guard let uid = user.id else { return }
        
        service.fetchLikedPosts(forUid: uid) { posts in
            self.likedPosts = posts
            
            for index in 0 ..< posts.count {
                let uid = posts[index].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedPosts[index].user = user
                }
            }
        }
    }
}
