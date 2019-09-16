//
//  ContentView.swift
//  PokedexUI
//
//  Created by Femke Offringa on 26/07/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import SwiftUI
import Grid

struct ContentView: View {
    var pokemon: [Pokemon]
    
    var body: some View {
        Grid(pokemon){ monster in
            pokeImageCell(pokemon: monster)
        }.padding(.horizontal, 8)
        .gridStyle(
            AutoColumnsGridStyle(minItemWidth: 100, itemHeight: 100, hSpacing: 8, vSpacing: 8)
        )
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
        return Image("Charmander")
                .resizable()
                .scaledToFit()
    }
}
