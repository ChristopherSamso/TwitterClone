//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Christopher Samso on 9/19/22.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
