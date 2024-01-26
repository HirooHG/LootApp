//
//  Item.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    var id: UUID = UUID()
    var name: String
    var quantity: Int
    var attackStrength: Int?
    var rarity: Rarity
    var itemType: ItemType
    var game: Game
    var cover: URL?
}
