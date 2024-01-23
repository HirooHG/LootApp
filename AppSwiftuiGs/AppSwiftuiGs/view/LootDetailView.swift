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
            DetailsView(item: item)
        }
    }
}

#Preview {
    LootDetailView(item: Inventory().loot[0])
}
