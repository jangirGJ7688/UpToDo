//
//  IndexView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 09/05/24.
//

import SwiftUI

struct IndexView: View {
    var body: some View {
        ZStack{
            Text("This is the index View")
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.red.opacity(0.5))
    }
}

#Preview {
    IndexView()
}
