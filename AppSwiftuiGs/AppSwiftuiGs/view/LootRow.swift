//
//  LootRow.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI

struct LootRow: View {
    let item: Item
    
    var body: some View {
        HStack(
            alignment: .center
        ) {
            HStack {
                Circle()
                    .fill(item.rarity.getColor())
                    .frame(width: 10)
                Text("\(item.name) x\(item.quantity)")
            }
            Spacer()
            Text(item.itemType.rawValue)
        }
    }
}

#Preview {
    LootRow(item: Inventory().loot[0])
}
