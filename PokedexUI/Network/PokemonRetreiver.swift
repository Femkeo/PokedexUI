//
//  PokemonRetreiver.swift
//  PokedexUI
//
//  Created by Femke Offringa on 16/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation
import Combine

class PokemonRetreiver: ObservableObject{
    
    @Published var pokemonList = [Pokemon]()
    
    func fetchPokemonFromApi(limit: String, offset: String, completion: @escaping() -> Void){
        PokApi.fetchFullPokedex(limit: limit, offset: offset).execute().responseJSON{ [weak self]
            response  in
            switch response.result{
            case .success:
                do{
                    if let data = response.data{
                        let pokeFetchResult = try JSONDecoder().decode(PokemonFetchResult.self, from: data)
                        DispatchQueue.main.async {
                            self?.pokemonList = pokeFetchResult.results
                            self?.addMetaUrlForEachPokemon()
                            print("---- added pokemon names and urls")
                            self?.randomOwned()
                            completion()
                        }
                    }
                }catch{
                    print("---- Could not fetch pokeFetchResult")
                    completion()
                }
            case .failure(let error):
                print("---- Error: \(error)")
                completion()
            }
        }
    }
    
    func addMetaUrlForEachPokemon(){
        for pokemon in pokemonList{
            var pokemonToUpdate = pokemon
            pokemonToUpdate.metaData = PokemonMetaData()
            pokemonToUpdate.metaData = PokemonMetaData(url: pokemon.url)
            findAndUpdatePokemon(pokemon: pokemonToUpdate)
        }
    }
    
    //TODO: Removed this function when a button of some sort has been added to keep track of owned pokemon
    func randomOwned(){
        var number = 0
        while number < 50 {
            let randomIndex = Int(arc4random_uniform(UInt32(pokemonList.count)))
            pokemonList[randomIndex].isOwned = true
            number += 1
        }
    }
    
    func findAndUpdatePokemon(pokemon: Pokemon){
        if let index = pokemonList.firstIndex(where: { $0.id == pokemon.id }), index > 0{
            pokemonList[index] = pokemon
        }
    }
    
    func fetchCharacteristics(id: Int){
        PokApi.fetchCharacteristics(id: id).execute().responseJSON{ [weak self]
            response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        let characteristicResult = try JSONDecoder().decode(CharacteristicResult.self, from: data)
                        if id == 1 {
                            print("what?")
                        }
                        for description in characteristicResult.descriptions{
                            if id == 1 {
                                print("what?")
                            }
                            if description.language.name == "en"{
                                print("---- Added description to pokemon with id: \(id)")
                                if id == 1 {
                                    print("what?")
                                }
//                                self?.pokemonList[id].characteristic = description.description
                            }
                        }
                    }
                    catch{
                        print("---- Could not fetch CharacteristicResult")
                    }
                }
            case .failure(let error):
                print("---- Error: \(error)")
            }
        }
    }
}
