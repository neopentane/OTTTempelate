//
//  OTTTemplateAppApp.swift
//  OTTTemplateApp
//
//  Created by Shreeram Kelkar on 03/10/23.
//

import SwiftUI
import SwiftData

@main
struct OTTTemplateAppApp: App {
    @StateObject private var coordinator = AppCoordinator()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            if coordinator.isLaunchScreenPresented {
                LaunchScreenView()
                    .onAppear {
                        coordinator.didFinishLaunching()
                    }
            } else {
                MainTabView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
