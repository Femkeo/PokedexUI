//
//  ContentView.swift
//  PokedexUI
//
//  Created by Femke Offringa on 26/07/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Combine
import SwiftUI
import Grid

struct PokemonOverview: View {
    @ObservedObject var pokemonRetriever : PokemonRetreiver
    
    //created init, ONLY to change the navbar font..
    init(pokemonRetriever: PokemonRetreiver){
        self.pokemonRetriever = pokemonRetriever
        UIFont(name: "Quicksand-Bold", size: 36).map {
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : $0]
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("CreamColor").edgesIgnoringSafeArea(.all)
                if pokemonRetriever.pokemonList.count > 0{
                    Grid(pokemonRetriever.pokemonList){ pokemon in
                        Color.white.cornerRadius(10)
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)){
                            pokeImageCell(pokemon: pokemon)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal, 8)
                    .gridStyle(
                        AutoColumnsGridStyle(minItemWidth: 80, itemHeight: 90, spacing: 8))
                        .navigationBarTitle(Text( "Pokemon"))
                        .navigationViewStyle(DoubleColumnNavigationViewStyle())
                }else{
                    Text("Could not connect to the internet.")
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let retreiver = PokemonRetreiver()
        retreiver.pokemonList = testData
        return PokemonOverview(pokemonRetriever: retreiver)
    }
}
#endif

struct pokeImageCell : View{
    let pokemon : Pokemon
    
    var body: some View {
        return ZStack(alignment: .topLeading){
            ZStack(alignment: .center){
                //TODO: Add a button somewhere that will recognize all the pokemon that are owned
                if pokemon.isOwned == true{
                    captureHighlight()
                }
                pokemon.sprites.map{
                    ImageViewLoader(imageUrl: $0.front_default)
                }
            }
            ZStack(alignment: .topLeading){
                pokemon.id.map {
                    CustomBlackFont(text:"\($0)")
                }
            }
        }
    }
}

struct captureHighlight: View {
    var body: some View {
        return ZStack {
            Image("pokeball")
                .resizable()
                .frame(width: 40, height: 40)
                .opacity(0.2)
        }
    }
}

