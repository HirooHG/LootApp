//
//  Rarity.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import Foundation
import SwiftUI

enum Rarity: String, CaseIterable {
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique
    
    func getColor() -> Color {
        switch self {
            case .common:
                return .gray
            case .uncommon:
                return .green
            case .rare:
                return .orange
            case .epic:
                return .purple
            case .legendary:
                return .yellow
            case .unique:
                return .red
        }
    }
}
