//
//  TestData.swift
//  PokedexUI
//
//  Created by Femke Offringa on 26/07/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation
import SwiftUI

struct Pokemon: Codable{
    var id : String {
        get{
            fetchId(url: self.url)
        }
    }
    var name: String
    var isOwned : Bool? = true
    var url: String
    var metaData: PokemonMetaData?
    
    init(name: String, isOwned: Bool? = false, url: String, metaData: PokemonMetaData){
        self.name = name
        self.isOwned = isOwned
        self.url = url
        self.metaData = metaData
    }
        
    func fetchId(url: String) -> String{
        var result = url.components(separatedBy: "/")
        result = result.dropLast()
        if let last = result.last{
            return last
        }else{
            return ""
        }
    }
}

class PokemonFetchResult: Codable{
    var count : Int
    var next : String?
    var previous : String?
    var results : [Pokemon]
}

struct PokemonMetaData: Identifiable, Codable{
    var url: String?
    var id : Int?
    var name: String?
    var types : [PokemonType]?
    var sprites : Sprites?
    var moves : [PokemonMove]?
}



