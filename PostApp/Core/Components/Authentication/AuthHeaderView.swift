//
//  AuthHeaderView.swift
//  PostApp
//
//  Created by Фараби Иса on 04.01.2023.
//

import SwiftUI

struct AuthHeaderView: View {
    var title: String
    
    var body: some View {
        VStack {
            HStack { Spacer()}
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemMint))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
        .clipShape(RoundedShape(corners: [.bottomLeft]))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title: "Welcome back")
    }
}
