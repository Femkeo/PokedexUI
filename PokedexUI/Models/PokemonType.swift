//
//  Type.swift
//  PokedexUI
//
//  Created by Femke Offringa on 19/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation

struct PokemonTypeMeta: Identifiable, Codable, Hashable{
    var id: UUID? = UUID()
    var name: String
}

struct PokemonType: Identifiable, Codable, Hashable{
    var id : UUID? = UUID()
    var slot: Int
    var type: PokemonTypeMeta
}
