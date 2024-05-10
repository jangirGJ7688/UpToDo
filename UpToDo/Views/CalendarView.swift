//
//  CalendarView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 09/05/24.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        ZStack{
            Text("This is the calendar View")
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.blue.opacity(0.5))
    }
}

#Preview {
    CalendarView()
}
