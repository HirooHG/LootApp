//
//  ContentView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedFeature: LooterFeatures = .Loot
    let actionReverseOnboarding: () -> Void
    
    var body: some View {
        TabView(selection: $selectedFeature) {
            LootView(actionReverseOnboarding: actionReverseOnboarding)
                .tabItem {
                    Label("Loot", systemImage: "bag.fill")
                }
                .tag(LooterFeatures.Loot)
            WishListView(actionReverseOnboarding: actionReverseOnboarding)
                .tabItem {
                    Label("Wishlist", systemImage: "heart.fill")
                }
                .tag(LooterFeatures.Wishlist)
            ProfileView(actionReverseOnboarding: actionReverseOnboarding)
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(LooterFeatures.Profile)
        }
    }
}

#Preview {
    ContentView(actionReverseOnboarding: {})
}
