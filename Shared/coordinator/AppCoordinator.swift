//
//  AppCoordinator.swift
//  OTTTemplateApp
//
//  Created by Shreeram Kelkar on 03/10/23.
//

import Foundation

class AppCoordinator: ObservableObject {
    @Published var isLaunchScreenPresented = true

    func didFinishLaunching() {
        // This function can be used to perform any startup tasks.
        // For example, loading initial data.
        // After that, set `isLaunchScreenPresented` to false to dismiss the launch screen.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLaunchScreenPresented = false
        }
    }
}
