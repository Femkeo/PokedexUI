//
//  PokemonMetaView.swift
//  PokedexUI
//
//  Created by Femke Offringa on 25/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import SwiftUI

struct PokemonMetaDataView : View{
    let pokemonMetaData : PokemonMetaData
    let screenWidth: CGFloat
    
    var body : some View {
        VStack(alignment: .leading){
//            if pokemon.characteristic != nil{
//                lineView(width: screenWidth)
//                discriptionView(pokemon: pokemon).padding(.leading, 8).padding(.trailing, 8)
//            }
            lineView(width: screenWidth)
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    HStack{
                        RedBoldFont(text: "Name:")
                        Spacer()
                        pokemonMetaData.name.map{
                            CustomFont(text:($0).capitalized)
                        }
                    }
                    //meh
                    if pokemonMetaData.types != nil{
                        HStack(alignment: .top){
                            RedBoldFont(text:"Type:")
                            Spacer()
                            pokemonMetaData.types.map {
                                typeRow(types: $0)
                            }
                        }
                    }
                }.padding(.leading, 8)
                VStack(alignment: .trailing){
                    HStack{
                        RedBoldFont(text:"Base stat:")
                        Spacer()
                        CustomFont(text:"136")
                    }
                    HStack{
                        RedBoldFont(text:"Size:")
                        Spacer()
                        CustomFont(text:"1.35m")
                    }
                }.padding(.trailing, 8)
            }
            VStack(alignment: .leading){
                RedBoldFont(text:"Location:")
                CustomFont(text:"Look in tall pieces of grass")
            }.padding(.leading, 8).padding(.trailing, 8)
        }
    }
}

struct PokemonMetaView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonMetaDataView(pokemonMetaData: pokemonTestMetaData.first ?? PokemonMetaData(), screenWidth: 375.0)
    }
}

//struct discriptionView: View {
//    let pokemon: Pokemon
//    
//    var body: some View{
//        HStack{
//            pokemon.characteristic.map {
//                CustomFont(text: $0)
//            }
//        }
//    }
//}

struct lineView : View {
    let width : CGFloat
    var body: some View {
        HStack{
            Rectangle().frame(width: width, height: 1).foregroundColor(Color.red)
        }
    }
}

struct typeRow: View{
    let types : [PokemonType]
    
    var body: some View{
        VStack(alignment: .trailing){
            ForEach(types, id: \.type){ type in
                CustomFont(text:type.type.name)
            }
        }
    }
}

