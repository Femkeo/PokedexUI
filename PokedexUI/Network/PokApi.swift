//
//  PokApi.swift
//  PokedexUI
//
//  Created by Femke Offringa on 16/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Alamofire
import Foundation

enum PokApi{
    case fetchFullPokedex(limit: String, offset: String)
    case fetchSinglePokeData(url: String)
    case fetchCharacteristics(id: Int)
    
    func path() -> String{
        switch self{
        case .fetchFullPokedex(let limit, let offset):
            return "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)"
            //pokemon = 802
            //full list = 807
        case .fetchSinglePokeData(let url):
            return "\(url)"
        case .fetchCharacteristics(let id):
            return "https://pokeapi.co/api/v2/characteristic/\(id)/"
        }
    }
    
    func method() -> HTTPMethod{
        return .get
    }
    
    func execute() -> DataRequest {
        print("Request == \(self)")
        return Alamofire.request(path(), method: method(), encoding: JSONEncoding.default, headers: [:])
    }
    
}
