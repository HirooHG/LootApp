//
//  DetailsView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/23/24.
//

import SwiftUI

struct DetailsView: View {
    let item: Item
    
    var body: some View {
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
                Text("Power: \(item.attackStrength ?? 0)")
                Text("Pocessed: \(item.quantity)")
                Text("Rarity: \(item.rarity.rawValue)")
                if let cover = item.cover {
                    AsyncImage(url: cover) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 150)
                                .containerShape(RoundedRectangle(cornerRadius: 4))
                                .clipShape(.rect(cornerRadius: 4))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DetailsView(item: Inventory().loot[0])
}
