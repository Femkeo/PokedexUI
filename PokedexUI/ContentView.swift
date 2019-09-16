//
//  ContentView.swift
//  PokedexUI
//
//  Created by Femke Offringa on 26/07/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var pokemon: [Pokemon]
    
    var body: some View {
        ZStack{
            Color.blue
            .edgesIgnoringSafeArea(.all)
            VStack{
                List(pokemon){ poke in
                    pokeImageCell(pokemon: poke)
                    .foregroundColor(Color.gray)
                    .background(Color.yellow)
                }.background(Color.red)
            }.background(Color.clear)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokemon: testData)
    }
}
#endif


struct pokeImageCell : View{
    let pokemon : Pokemon?
    
    var body: some View {
        return HStack{
            Image("Charmander")
                .resizable()
                .frame(width: 100, height: 100, alignment: .leading)
            Text(pokemon?.name ?? "")
        }
    }
    
}
