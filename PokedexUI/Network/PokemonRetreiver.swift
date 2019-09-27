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
                        self?.pokemonList = pokeFetchResult.results
                        self?.fetchIndividualPokeData()
                        print("---- added pokemon names and urls")
                        self?.randomOwned()
                        completion()
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
    
    func fetchIndividualPokeData() {
        for pokemon in pokemonList{
            PokApi.fetchSinglePokeData(url: pokemon.url).execute().responseJSON{ [weak self]
                response in
                switch response.result{
                case .success:
                    if let data = response.data{
                        do{
                            let singlePokeFetchResult = try JSONDecoder().decode(SinglePokemonFetchResult.self, from: data)
                            let pokemonIndex = (singlePokeFetchResult.id - 1)
                            DispatchQueue.main.async {
                                self?.pokemonList[pokemonIndex].id = singlePokeFetchResult.id
                                self?.pokemonList[pokemonIndex].types = singlePokeFetchResult.types
                                self?.pokemonList[pokemonIndex].moves = singlePokeFetchResult.moves
                                print("---- Starting download of sprite images")
                                self?.fetchIndividualSpriteImage(pokeSprites: singlePokeFetchResult.sprites, index: pokemonIndex)
                                self?.fetchCharacteristics(id: singlePokeFetchResult.id)
                            }
                        }catch{
                            print("---- Could not fetch singlePokeFetchResult")
                        }
                    }
                case .failure(let error):
                    print("---- Error: \(error)")
                }
            }
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
                                self?.pokemonList[id].characteristic = description.description
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
    
    
    func fetchIndividualSpriteImage(pokeSprites: Sprites, index: Int){
        
        self.pokemonList[index].spriteImages = SpriteImages(id: UUID(), front_default: Data(), front_female: nil, front_shiny: Data(), front_shiny_female: nil)
        
        let defaultImageUrl = pokeSprites.front_default
        ImageDownloader().download(from: defaultImageUrl){ imageData in
            DispatchQueue.main.async{
                self.pokemonList[index].spriteImages?.front_default = imageData
            }
        }
        
        if let femaleImage = pokeSprites.front_female{
            ImageDownloader().download(from: femaleImage){ imageData in
                DispatchQueue.main.async{
                    self.pokemonList[index].spriteImages?.front_female = imageData
                }
            }
        }
        
        let shinyImage = pokeSprites.front_shiny
        ImageDownloader().download(from: shinyImage){ imageData in
            DispatchQueue.main.async{
                self.pokemonList[index].spriteImages?.front_shiny = imageData
            }
        }
        
        if let shinyFemaleImage = pokeSprites.front_shiny_female{
            ImageDownloader().download(from: shinyFemaleImage){ imageData in
                DispatchQueue.main.async{
                    self.pokemonList[index].spriteImages?.front_shiny_female = imageData
                }
            }
        }
    }
}
