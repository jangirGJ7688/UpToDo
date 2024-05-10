//
//  ProfileView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 09/05/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Text("This is the profile View")
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.green.opacity(0.5))
    }
}

#Preview {
    ProfileView()
}
