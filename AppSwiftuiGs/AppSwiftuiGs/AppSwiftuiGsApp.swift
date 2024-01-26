//
//  AppSwiftuiGsApp.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI

@main
struct AppSwiftuiGsApp: App {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingDone {
                ContentView(actionReverseOnboarding: {
                    isOnboardingDone = false
                })
            } else {
                OnboardingScreenView(actionGs: {
                    isOnboardingDone = true
                })
            }
            
        }
    }
}
