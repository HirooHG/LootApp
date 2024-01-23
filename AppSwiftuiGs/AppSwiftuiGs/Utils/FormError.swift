//
//  FormError.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/23/24.
//

import Foundation

enum FormError: String {
    case NameItemMinLengthOrEmpty = "Your item's name must me > 3 letters long"
    case TypeUnknown = "Please describe the item's type"
    case GameEmpty = "Please fill the item's game"
    case Unknown
}
