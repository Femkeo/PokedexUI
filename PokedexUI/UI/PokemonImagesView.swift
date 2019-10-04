//
//  PokemonImagesVke.swift
//  PokedexUI
//
//  Created by Femke Offringa on 20/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import SwiftUI

struct PokemonImagesView: View {
    let sprites : Sprites
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

struct ImageViewLoader : View {
    @ObservedObject var imageLoader : ImageDownloader
    
    init(imageUrl: String){
        imageLoader = ImageDownloader(imageURL: imageUrl)
    }
    
    var body : some View {
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(named: "WhoIsThisPokemon")! : UIImage(data: imageLoader.data)!)
            .resizable()
            .scaledToFit()
            .opacity((imageLoader.data.count == 0) ? 0.2 : 1.0)
    }
}

struct femaleImages: View{
    let sprites : Sprites
    
    var body: some View {
        HStack(alignment: .top){
            sprites.front_female.map{
                ImageViewLoader(imageUrl: $0)
            }
            sprites.front_shiny_female.map{
                ImageViewLoader(imageUrl: $0)
            }
        }
    }
}

struct defaultImages: View {
    let sprites : Sprites

    var body: some View {
        HStack{
            ImageViewLoader(imageUrl: sprites.front_default)
            ImageViewLoader(imageUrl: sprites.front_shiny)
        }
    }
}

struct PokemonImagesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImagesView(
            sprites: Sprites(id: UUID(),
                             front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
                             front_female: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/female/25.png",
                             front_shiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png",
                             front_shiny_female: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/female/25.png"),
            showFemale: false)
    }
}
