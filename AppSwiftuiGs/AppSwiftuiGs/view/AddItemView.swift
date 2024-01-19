//
//  AddItemView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI

struct AddItemView: View {
    @State var name = ""
    @State var rarity = Rarity.common
    @State var game = Game.emptyGame
    @State var nb = 0
    @State var itemType = ItemType.unknown
    @State var isAttack = false
    @State var attack = 1
    
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Section {
                    Picker("Jeux", selection: $game) {
                        ForEach(availableGames, id: \.self) { gameItem in
                            Text(gameItem.name)
                        }
                    }
                    Stepper {
                        Text("Combien: \(nb)")
                    } onIncrement: {
                        nb += 1
                    } onDecrement: {
                        if nb > 0 { nb -= 1 }
                    }
                    .padding(5)
                }
            }
            Section {
                HStack {
                    Text("Type")
                    Spacer()
                    Text(itemType.rawValue)
                }
                Picker("type \(itemType.rawValue)", selection: $itemType) {
                    ForEach(ItemType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                    .pickerStyle(.palette)
                    .paletteSelectionEffect(.symbolVariant(.slash))
            }
            Section {
                Toggle(isOn: $isAttack.animation()) {
                    Text("Attack ?")
                }
                if isAttack {
                    Stepper {
                        Text("Force d'attaque: \(attack)")
                    } onIncrement: {
                        attack += 1
                    } onDecrement: {
                        if attack > 1 { attack -= 1 }
                    }.animation(.bouncy, value: isAttack)
                }
            }
            Section {
                Button(action: {
                    inventory.addItem(item: Item(
                        name: name,
                        quantity: nb,
                        rarity: rarity,
                        attackStrength: isAttack ? attack : nil,
                        game: game,
                        itemType: itemType
                    ))
                    dismiss()
                }, label: {
                    Text("Ajouter")
                })
            }
        }
    }
}

#Preview {
    AddItemView()
}
