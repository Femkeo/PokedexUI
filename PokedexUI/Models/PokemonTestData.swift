//
//  PokemonTestData.swift
//  PokedexUI
//
//  Created by Femke Offringa on 24/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import SwiftUI

#if DEBUG
let testData = [
    Pokemon(name: "Bulbasaur",
            url: "https://pokeapi.co/api/v2/pokemon/1/",
            metaData: PokemonMetaData(url: "https://pokeapi.co/api/v2/pokemon/1/",
                                      id: 1,
                                      name: "Bulbasaur",
                                      types: [
                                        PokemonType(id: UUID(),slot: 1, type: PokemonTypeMeta(id: UUID(), name: "Grass")),
                                        PokemonType(id: UUID(), slot: 2, type: PokemonTypeMeta(id: UUID(), name: "Poison"))],
                                      sprites: Sprites(id: UUID(),
                                                       front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
                                                       front_female: nil,
                                                       front_shiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png",
                                                       front_shiny_female: nil)
        )
    ),
    Pokemon(name: "Pikachu",
            url: "https://pokeapi.co/api/v2/pokemon/25/",
            metaData: PokemonMetaData(url: "https://pokeapi.co/api/v2/pokemon/25/",
                                      id: 25,
                                      name: "Pikachu",
                                      types: [
                                        PokemonType(id: UUID(),slot: 1, type: PokemonTypeMeta(id: UUID(), name: "Grass")),
                                        PokemonType(id: UUID(), slot: 2, type: PokemonTypeMeta(id: UUID(), name: "Poison"))],
                                      sprites: Sprites(id: UUID(),
                                                       front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
                                                       front_female: nil,
                                                       front_shiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png",
                                                       front_shiny_female: nil)
        )
    ),
]
#endif
