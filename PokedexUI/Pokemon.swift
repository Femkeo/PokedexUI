//
//  TestData.swift
//  PokedexUI
//
//  Created by Femke Offringa on 26/07/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct Pokemon: Identifiable{
    var id = UUID()
    var name: String
    var type: [String]
    var evolutionPokemon: String?
    var evolutionLevel: Int?
}

#if DEBUG
let testData = [
    Pokemon(name: "Bulbasaur", type: ["Grass"], evolutionPokemon: "Ivysaur", evolutionLevel: 16),
    Pokemon(name: "Ivysaur", type: ["Grass", "Poison"], evolutionPokemon: "Venusaur", evolutionLevel: 30),
    Pokemon(name: "Venusaur", type: ["Grass", "Poison"]),
    Pokemon(name: "Squirtle", type: ["Water"], evolutionPokemon: "Wartortle", evolutionLevel: 16),
    Pokemon(name: "Wartortle", type: ["Water"], evolutionPokemon: "Blastoise", evolutionLevel: 30),
    Pokemon(name: "Blastoise", type: ["Water"]),
    Pokemon(name: "Charmander", type: ["Fire"], evolutionPokemon: "Charmeleon", evolutionLevel: 16),
    Pokemon(name: "Charmeleon", type: ["Fire"], evolutionPokemon: "Charizard", evolutionLevel: 30),
    Pokemon(name: "Charizard", type: ["Fire", "Flying"])]
#endif


