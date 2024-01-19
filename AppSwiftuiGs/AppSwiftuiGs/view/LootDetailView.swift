//
//  LootDetailView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    let item: Item
    
    var body: some View {
        VStack {
            RarityView(item: item)
            List {
                Section(header: Text("Informations")) {
                    HStack {
                        if let cover = item.game.coverName {
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
                        Text(item.game.name)
                    }
                    Text("In-game: \(item.name)")
                    Text("Puissance: \(item.attackStrength ?? 0)")
                    Text("Possédé(s): \(item.quantity)")
                    Text("Possédé(s): \(item.rarity.rawValue)")
                }
            }
        }
    }
}

#Preview {
    LootDetailView(item: Inventory().loot[0])
}
