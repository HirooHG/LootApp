//
//  LootDetailView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    let item: Item
    @State var isEditing = false
    
    var body: some View {
        NavigationStack {
            VStack {
                RarityView(item: item)
                DetailsView(item: item)
            }
            .sheet(isPresented: $isEditing, onDismiss: {
                isEditing = false
            }, content: {
                AddItemView(
                    id: item.id,
                    name: item.name,
                    rarity: item.rarity,
                    game: item.game,
                    nb: item.quantity,
                    itemType: item.itemType,
                    attack: item.attackStrength ?? 0,
                    isAttack: item.attackStrength != nil
                )
            })
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        isEditing.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "pencil")
                            Text("Editer")
                        }
                    })
                }
            })
        }
    }
}

#Preview {
    LootDetailView(item: Inventory().loot[0])
}
