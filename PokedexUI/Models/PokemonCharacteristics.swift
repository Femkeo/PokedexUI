//
//  PokemonCharacteristics.swift
//  PokedexUI
//
//  Created by Femke Offringa on 27/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation

class CharacteristicResult: Codable {
    var id: Int
    var descriptions: [CharacteristicDescription]
}

struct CharacteristicDescription : Identifiable, Codable{
    var id : UUID? = UUID()
    var description : String
    var language : Language
}

struct Language : Identifiable, Codable {
    var id : UUID? = UUID()
    var name: String
}
