//
//  ContentView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false
    
    var body: some View {
        NavigationStack {
            List(inventory.loot) { item in
                NavigationLink {
                    LootDetailView(item: item)
                } label: {
                    LootRow(item: item)
                }
            }
            .sheet(isPresented: $showAddItemView, onDismiss: { showAddItemView = false },content: {
                AddItemView()
            })
            .navigationBarTitle("Loot")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
        }
        .environmentObject(inventory)
        
    }
}

#Preview {
    ContentView()
}
