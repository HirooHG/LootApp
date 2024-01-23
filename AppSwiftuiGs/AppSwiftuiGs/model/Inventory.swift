//
//  Inventory.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import Foundation

class Inventory: ObservableObject {
    @Published var loot = [
        Item(
            name: "Epée",
            quantity: 1,
            rarity: Rarity.common,
            attackStrength: 5,
            game: availableGames[0],
            itemType: ItemType.dagger),
        Item(
            name: "Bouclier",
            quantity: 1,
            rarity: Rarity.uncommon,
            attackStrength: nil,
            game: availableGames[0],
            itemType: ItemType.shield),
        Item(
            name: "Armure",
            quantity: 1,
            rarity: Rarity.unique,
            attackStrength: nil,
            game: availableGames[1],
            itemType: ItemType.shield
        )
    ]
    
    func addItem(item: Item) {
        loot.append(item)
    }
}
