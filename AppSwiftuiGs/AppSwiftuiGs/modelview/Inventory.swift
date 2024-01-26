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
            attackStrength: 5,
            rarity: Rarity.common,
            itemType: ItemType.dagger,
            game: availableGames[1]),
        Item(
            name: "Bouclier",
            quantity: 1,
            attackStrength: nil,
            rarity: Rarity.uncommon,
            itemType: ItemType.shield,
            game: availableGames[2]),
        Item(
            name: "Armure",
            quantity: 1,
            attackStrength: nil,
            rarity: Rarity.unique,
            itemType: ItemType.shield,
            game: availableGames[3])
    ]
    
    func addItem(item: Item) {
        loot.append(item)
    }
}
