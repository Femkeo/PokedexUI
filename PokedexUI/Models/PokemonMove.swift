//
//  Move.swift
//  PokedexUI
//
//  Created by Femke Offringa on 19/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation

struct PokemonMove: Identifiable, Codable, Hashable{
    var id : UUID? = UUID()
    var move : Move
    var version_group_details : [MoveMeta]
}

struct Move: Identifiable, Codable, Hashable{
    var id: UUID? = UUID()
    var name: String
}

struct MoveMeta : Identifiable, Codable, Hashable{
    var id : UUID? = UUID()
    var level_learned_at : Int
    var move_learn_method: MoveLearnMethod
}

struct MoveLearnMethod : Identifiable, Codable, Hashable{
    var id : UUID? = UUID()
    var name : String
    var url : String
}
