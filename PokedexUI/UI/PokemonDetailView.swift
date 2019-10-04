//
//  PokemonDetailView.swift
//  PokedexUI
//
//  Created by Femke Offringa on 18/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import SwiftUI
import Combine

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @State var shouldShowFemale = false
    
    var body: some View {
        ZStack{
            GeometryReader{ geo in
                pokemonMetaDataLoader(url: self.pokemon.url, screenFrame: geo)
            }
        }
    }
}

struct PokemonGenderButton : View {
    let shouldShowFemale: Bool
    
    var body : some View {
        if shouldShowFemale{
            return Image("female")
                .resizable().frame(width: 20, height: 20, alignment: .center)
        }else{
            return Image("male").resizable().frame(width: 20, height: 20, alignment: .center)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        pokemonTestData.first.map {
            PokemonDetailView(pokemon: $0)
        }
    }
}


struct pokemonMetaDataLoader : View {
    @ObservedObject var metaLoader : PokemonMetaDataRetriever
    @State var shouldShowFemale = false
    var screenFrame : GeometryProxy
    
    init(url: String, screenFrame: GeometryProxy){
        self.metaLoader = PokemonMetaDataRetriever(url: url)
        self.screenFrame = screenFrame
    }
    
    var body: some View {
        ZStack{
            metaLoader.singlePokemonMetaData.map{
                pokeView(metaData: $0, female: shouldShowFemale, screenFrame: screenFrame)
                    .navigationBarTitle(Text(("\($0.name ?? "")").capitalized), displayMode: .large).font(Font.custom("Quicksand-Regular", size: 36.0))
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.shouldShowFemale = !self.shouldShowFemale
                        }){
                            if (metaLoader.singlePokemonMetaData ?? PokemonMetaData()).sprites?.front_female != nil {
                                PokemonGenderButton(shouldShowFemale: shouldShowFemale)
                            }
                        }
                )
            }
        }
    }
}


struct pokeView: View{
    let metaData: PokemonMetaData
    let female : Bool
    let screenFrame : GeometryProxy
    
    var body: some View{
        VStack(){
            metaData.sprites.map{
                PokemonImagesView(sprites: $0, showFemale: female).frame(height: screenFrame.size.height / 4)
            }
            PokemonMetaDataView(pokemonMetaData: metaData, screenWidth: screenFrame.size.width).frame(alignment: .leading)
            VStack{
                self.metaData.moves.map{
                    PokemonMovesView(moves: $0, screenWidth: screenFrame.size.width)
                }
            }
        }
    }
}



