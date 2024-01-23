//
//  Item.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import Foundation

class Item: Identifiable {
    let id: UUID = UUID()
    let name: String
    let quantity: Int
    let rarity: Rarity
    let itemType: ItemType
    let attackStrength: Int?
    let game: Game
    
    init(name: String, quantity: Int, rarity: Rarity, attackStrength: Int?, game: Game, itemType: ItemType) {
        self.name = name
        self.quantity = quantity
        self.rarity = rarity
        self.attackStrength = attackStrength
        self.game = game
        self.itemType = itemType
    }
}
