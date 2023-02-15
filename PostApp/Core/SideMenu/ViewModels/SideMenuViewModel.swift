//
//  SideMenuViewModel.swift
//  PostApp
//
//  Created by Фараби Иса on 03.01.2023.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case logout
    
    var title: String {
        switch self {
            case .profile: return "Profile"
            case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
            case .profile: return "person" 
            case .logout: return "arrow.left.square"
        }
    }
}
