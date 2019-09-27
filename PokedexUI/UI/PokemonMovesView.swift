//
//  PokemonMovesView.swift
//  PokedexUI
//
//  Created by Femke Offringa on 19/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import SwiftUI

struct PokemonMovesView: View {
    let moves : [PokemonMove]
    let screenWidth : CGFloat
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    WhiteTitleFont(text: "Moves").frame(width: screenWidth).padding(5)
                }.background(Color.red)
                VStack{
                    List {
                        HStack{
                            VStack(alignment:.leading){
                                BlackBoldFont(text: "Name")
                                ForEach(moves, id: \.move){ move in
                                    CustomFont(text:move.move.name)
                                }
                            }.frame(width: screenWidth / 3, alignment: .leading).padding(.leading, 8)
                            
                            Spacer()
                            VStack(alignment:.leading){
                                BlackBoldFont(text: "Level")
                                ForEach(moves, id: \.move){ move in
                                    CustomFont(text:"\(move.version_group_details[0].level_learned_at == 0 ? "-" : "\(move.version_group_details[0].level_learned_at)")")
                                }
                            }.frame(width: screenWidth / 3.5, alignment: .leading)
                            
                            Spacer()
                            VStack(alignment:.leading){
                                BlackBoldFont(text: "Method")
                                ForEach(moves, id: \.move){ move in
                                    CustomFont(text:"\(move.version_group_details[0].move_learn_method.name)")
                                }
                            }.frame(width: screenWidth / 3, alignment: .leading)
                        }
                    }
                }
            }
        }
    }
}

struct PokemonMovesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonMovesView(moves: [
            PokemonMove(
                id: UUID(),
                move: Move(
                        id: UUID(),
                        name: "cut"),
                version_group_details: [MoveMeta(
                    id: UUID(),
                    level_learned_at: 0,
                    move_learn_method: MoveLearnMethod(
                        name: "machine",
                        url: "https:www.blabla.nl"))]
            )],
                         screenWidth: 375)
    }
}
