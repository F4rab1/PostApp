//
//  ExploreViewModel.swift
//  PostApp
//
//  Created by Фараби Иса on 08.02.2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    let service = UserService()
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()

            return users.filter({
                $0.username.contains(lowercasedQuery) || $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
