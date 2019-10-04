//
//  PokemonMetaDataFetcher.swift
//  PokedexUI
//
//  Created by Femke Offringa on 03/10/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation

class PokemonMetaDataRetriever : ObservableObject{
    
    @Published var singlePokemonMetaData : PokemonMetaData?
    
    init(url: String){
        PokApi.fetchSinglePokeData(url: url).execute().responseJSON{
            response in
            switch response.result{
            case .success:
                if let data = response.data{
                    do{
                        let fetchResult = try JSONDecoder().decode(PokemonMetaData.self, from: data)
                        DispatchQueue.main.async {
                            self.singlePokemonMetaData = fetchResult
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
