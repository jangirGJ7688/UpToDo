//
//  HomeView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 06/05/24.
//

import SwiftUI
import DeviceActivity

struct HomeView: View {
    
    @State var salectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                TabView(selection: $salectedTab) {
                    IndexView()
                        .tag(0)
                    
                    CalendarView()
                        .tag(1)
                    
                    FocusView()
                        .tag(2)
                    
                    ProfileView()
                        .tag(3)
                }
            }
            VStack {
                Spacer()
                TabbarView(salectedTab: $salectedTab, viewModel: TabbarViewModel())
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HomeView()
}
