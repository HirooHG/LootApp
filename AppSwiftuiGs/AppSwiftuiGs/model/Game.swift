//
//  Game.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "EldenRing"),
    Game(name: "Skyrim", genre: .rpg, coverName: "Skyrim"),
    Game(name: "WoW", genre: .mmorpg, coverName: "WoW"),
    Game(name: "CS:GO", genre: .fps, coverName: "CSGO"),
    Game(name: "Diablo IV", genre: .looter, coverName: "Diablo")
]
