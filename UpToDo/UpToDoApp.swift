//
//  UpToDoApp.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 04/05/24.
//

import SwiftUI
import Firebase

@main
struct UpToDoApp: App {
    
    @StateObject private var session = SessionManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView()
            }
            .environmentObject(session)
        }
    }
}
