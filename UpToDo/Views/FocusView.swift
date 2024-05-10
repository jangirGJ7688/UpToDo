//
//  FocusView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 09/05/24.
//

import SwiftUI

struct FocusView: View {
    var body: some View {
        ZStack{
            Text("This is the focus View")
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.cyan.opacity(0.5))
    }
}

#Preview {
    FocusView()
}
