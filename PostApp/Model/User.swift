//
//  User.swift
//  PostApp
//
//  Created by Фараби Иса on 07.02.2023.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
