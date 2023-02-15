//
//  PostAppApp.swift
//  PostApp
//
//  Created by Фараби Иса on 02.01.2023.
//

import SwiftUI
import Firebase

@main
struct PostAppApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
