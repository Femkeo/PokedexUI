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
                pokeView(poke: self.pokemon, female: self.shouldShowFemale, screenFrame : geo)
            }
        }
        .navigationBarTitle(Text((pokemon.name).capitalized), displayMode: .large).font(Font.custom("Quicksand-Regular", size: 36.0))
        .navigationBarItems(trailing:
            Button(action: {
                self.shouldShowFemale = !self.shouldShowFemale
            }){
                if pokemon.sprites?.front_female != nil {
                    PokemonGenderButton(pokemon: pokemon, shouldShowFemale: shouldShowFemale)
                }
            }
        )
    }
}


struct PokemonGenderButton : View {
    let pokemon : Pokemon
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
        testData.first.map {
            PokemonDetailView(pokemon: $0)
        }
    }
}


struct pokeView: View{
    let poke: Pokemon
    let female : Bool
    let screenFrame : GeometryProxy
    
    var body: some View{
        VStack(){
            poke.sprites.map{
                PokemonImagesView(sprites: $0, showFemale: female).frame(height: screenFrame.size.height / 4)
            }
            PokemonMetaDataView(pokemon: poke, screenWidth: screenFrame.size.width).frame(alignment: .leading)
            VStack{
                self.poke.moves.map{
                    PokemonMovesView(moves: $0, screenWidth: screenFrame.size.width)
                }
            }
        }
    }
}



