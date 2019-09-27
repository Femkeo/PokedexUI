//
//  Image.swift
//  PokedexUI
//
//  Created by Femke Offringa on 19/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation
import UIKit

enum Sprite : String{
    case front_default = "front_default"
    case front_female = "front_female"
    case front_shiny = "front_shiny"
    case front_shiny_female = "front_shiny_female"
}

struct Sprites: Codable, Identifiable{
    var id : UUID? = UUID()
    var front_default: String
    var front_female: String?
    var front_shiny: String
    var front_shiny_female: String?
}

struct SpriteImages: Codable, Identifiable{
    var id : UUID? = UUID()
    var front_default: Data
    var front_female : Data?
    var front_shiny : Data
    var front_shiny_female: Data?
}
