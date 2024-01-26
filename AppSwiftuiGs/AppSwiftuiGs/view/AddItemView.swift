//
//  AddItemView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI
import PhotosUI

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct AddItemView: View {
    @State var id: UUID? = nil
    @State var name: String = ""
    @State var rarity: Rarity = Rarity.common
    @State var game: Game = Game.emptyGame
    @State var nb: Int = 0
    @State var itemType: ItemType = ItemType.unknown
    @State var attack: Int = 0
    
    @State var photoItem: PhotosPickerItem? = nil
    @State var photoItemImage: Image? = nil
    
    @State var isAttack = false
    @State var isCustom = false

    
    @State var error = FormError.Unknown
    @State var showAlert = false
    
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) var dismiss
    
    func writeToDisk(image: UIImage, imageName: String) -> URL {
        let savePath = FileManager.documentsDirectory.appendingPathComponent("\(imageName).jpg")
        if let jpegData = image.jpegData(compressionQuality: 0.5) {
            try? jpegData.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
        return savePath
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Item's name", text: $name)
                Picker("Rarity", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Section {
                    Picker("Games", selection: $game) {
                        ForEach(availableGames, id: \.self) { gameItem in
                            Text(gameItem.name)
                        }
                    }
                    Stepper {
                        Text("How many: \(nb)")
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
                Toggle(isOn: $isCustom.animation()) {
                    Text("Item Custom ?")
                }
                if isCustom {
                    PhotosPicker(selection: $photoItem, matching: .images) {
                        Text("Select an image")
                    }
                        .buttonStyle(.borderless)
                        .animation(.bouncy, value: isAttack)
                }
                if photoItemImage != nil {
                    photoItemImage!
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                }
            }
            Section {
                Toggle(isOn: $isAttack.animation()) {
                    Text("Attack ?")
                }
                if isAttack {
                    Stepper {
                        Text("Power: \(attack)")
                    } onIncrement: {
                        attack += 1
                    } onDecrement: {
                        if attack > 1 { attack -= 1 }
                    }.animation(.bouncy, value: isAttack)
                }
            }
            Section {
                Button(action: {
                    if name.isEmpty || name.count < 3 {
                        error = FormError.NameItemMinLengthOrEmpty
                        showAlert = true
                        return
                    }
                    if game == Game.emptyGame {
                        error = FormError.GameEmpty
                        showAlert = true
                        return
                    }
                    if itemType == ItemType.unknown {
                        error = FormError.TypeUnknown
                        showAlert = true
                        return
                    }
                    let imageUi = ImageRenderer(content: photoItemImage).uiImage
                    let url = writeToDisk(image: imageUi!, imageName: name)
                    
                    if(self.id == nil)  {
                        inventory.addItem(item: Item(
                            name: name,
                            quantity: nb,
                            attackStrength: isAttack ? attack : nil,
                            rarity: rarity,
                            itemType: itemType,
                            game: game,
                            cover: url
                        ))
                    } else {
                        let index = inventory.loot.firstIndex(where: {
                            $0.id == self.id
                        })
                        let newItem = Item(
                            id: id!,
                            name: name,
                            quantity: nb,
                            attackStrength: isAttack ? attack : nil,
                            rarity: rarity,
                            itemType: itemType,
                            game: game,
                            cover: url
                        )
                        inventory.loot[index!] = newItem
                    }
                    dismiss()
                }, label: {
                    Text(
                        self.id == nil ? "Add" : "Save"
                    )
                })
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(error.rawValue)
                    )
                }
            }
        }
        .onChange(of: photoItem) {
            Task {
                if photoItem != nil {
                    if let image = try? await photoItem!.loadTransferable(type: Image.self) {
                        photoItemImage = image
                    }
                }
            }
        }
    }
}

#Preview {
    AddItemView()
}
