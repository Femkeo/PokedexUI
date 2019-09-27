//
//  PokemonImagesVke.swift
//  PokedexUI
//
//  Created by Femke Offringa on 20/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import SwiftUI

struct PokemonImagesView: View {
    let sprites : SpriteImages
    let showFemale : Bool
    
    var body: some View {
        HStack{
            if showFemale == true {
                femaleImages(sprites: sprites)
            }else{
                defaultImages(sprites: sprites)
            }
        }
    }
}

struct femaleImages: View{
    let sprites : SpriteImages
    
    var body: some View {
        HStack(alignment: .top){
            Image(uiImage: UIImage(data: sprites.front_female ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFit()
            Image(uiImage: UIImage(data: sprites.front_shiny_female ?? Data()) ?? UIImage(data: sprites.front_default) ?? UIImage())
                .resizable()
                .scaledToFit()
        }
    }
}

struct defaultImages: View {
    let sprites : SpriteImages
    
    var body: some View {
        HStack(alignment: .top){
            Image(uiImage: UIImage(data: sprites.front_default) ?? UIImage())
                .resizable()
                .scaledToFit()
            Image(uiImage: UIImage(data: sprites.front_shiny) ?? UIImage(data: sprites.front_default) ?? UIImage())
                .resizable()
                .scaledToFit()
        }
    }
}

struct PokemonImagesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImagesView(
            sprites: SpriteImages(id: UUID(),
                                  front_default: UIImage(imageLiteralResourceName: "Bulbasaur").pngData() ?? Data(),
                                  front_female: nil,
                                  front_shiny: UIImage(imageLiteralResourceName: "Shiny_Bulbasaur").pngData() ?? Data(),
                                  front_shiny_female: nil),
            showFemale: false)
    }
}
