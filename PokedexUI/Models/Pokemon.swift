//
//  TestData.swift
//  PokedexUI
//
//  Created by Femke Offringa on 26/07/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation
import SwiftUI

struct Pokemon: Identifiable, Codable{
    var id : Int?
    var name: String
    var isOwned : Bool? = true
    var characteristic : String?
    var url: String
    var sprites : Sprites?
    var types: [PokemonType]?
    var moves : [PokemonMove]?
}

class PokemonFetchResult: Codable{
    var count : Int
    var next : String?
    var previous : String?
    var results : [Pokemon]
}

class SinglePokemonFetchResult: Codable{
    var id : Int
    var types : [PokemonType]?
    var sprites : Sprites
    var moves : [PokemonMove]?
}

