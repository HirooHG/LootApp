//
//  ContentView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Inventory") {
                    ForEach(inventory.loot) { item in
                        NavigationLink {
                            LootDetailView(item: item)
                        } label: {
                            LootRow(item: item)
                        }
                    }
                }
                Section("Charts") {
                    Text("Your powerful items")
                    Chart {
                        ForEach(inventory.loot) { item in
                            if item.attackStrength != nil {
                                BarMark(
                                    x: .value("Item", item.name),
                                    y: .value("ATQ", item.attackStrength!),
                                    width: 10
                                )
                            }
                        }
                        .symbol(by: .value("ATQ", "ATQ"))
                    }
                }
                Section("Your games"){
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForEach(availableGames) { game in
                                if game != Game.emptyGame {
                                    HStack {
                                        if let cover = game.coverName {
                                            Image(cover)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 58)
                                                .containerShape(RoundedRectangle(cornerRadius: 4))
                                                .clipShape(.rect(cornerRadius: 4))
                                        } else {
                                            HStack {
                                                Image(systemName: "rectangle.slash")
                                                    .opacity(0.4)
                                            }
                                                .frame(width: 45, height: 58)
                                                .background(.gray.gradient.opacity(0.4))
                                                .clipShape(.rect(cornerRadius: 4))
                                        }
                                        Text(game.name)
                                    }
                                }
                            }
                        }
                    }.frame(height: 100)
                    
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
