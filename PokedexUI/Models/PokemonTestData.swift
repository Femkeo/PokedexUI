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
    Pokemon(
        id: 1,
        name: "Bulbasaur",
        isOwned: true,
        characteristic: "Loves to eat",
        url: "https://pokeapi.co/api/v2/pokemon/1/",
        spriteImages: SpriteImages(id: UUID(), front_default: UIImage(named: "Bulbasaur")!.pngData()!, front_female: nil, front_shiny: UIImage(named: "Shiny_Bulbasaur")!.pngData()!, front_shiny_female: nil),
        types: [
                PokemonType(id: UUID(),slot: 1, type: PokemonTypeMeta(id: UUID(), name: "Grass")),
                PokemonType(id: UUID(), slot: 2, type: PokemonTypeMeta(id: UUID(), name: "Poison"))]
    ),
    Pokemon(
        id: 2,
        name: "Ivysaur",
        isOwned: false,
        characteristic: "Loves to drink",
        url: "https://pokeapi.co/api/v2/pokemon/2/",
        spriteImages: SpriteImages(id: UUID(), front_default: UIImage(named: "Ivysaur")!.pngData()!, front_female: nil, front_shiny: UIImage(named: "Ivysaur")!.pngData()!, front_shiny_female: nil),
        types: [
        PokemonType(id: UUID(),slot: 1, type: PokemonTypeMeta(id: UUID(), name: "Grass")),
        PokemonType(id: UUID(), slot: 2, type: PokemonTypeMeta(id: UUID(), name: "Poison"))]
    )
]
#endif
