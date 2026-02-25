//
//  ToteTrackerApp.swift
//  ToteTracker
//
//  Created by Edward Houser on 2/5/26.
//

import SwiftUI
import SwiftData

@main
struct ToteTrackerApp: App {
    
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            User.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ZStack{
                if isLoggedIn {
                    HomeView()
                        .transition(.move(edge: .trailing))
                }
                else {
                    SignupView()
                        .transition(.move(edge: .leading))
                }
            }
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
