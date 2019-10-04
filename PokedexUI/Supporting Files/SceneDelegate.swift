//
//  SceneDelegate.swift
//  PokedexUI
//
//  Created by Femke Offringa on 26/07/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let pokemonRetreiver = PokemonRetreiver()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        // Use a UIHostingController as window root view controller
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            pokemonRetreiver.fetchPokemonFromApi(limit: "100", offset: "0", completion: { [weak self] in
                if let retriever = self?.pokemonRetreiver {
                    window.rootViewController = UIHostingController(rootView: PokemonOverview(pokemonRetriever: retriever))
                                                     self?.window = window
                                          window.makeKeyAndVisible()
                }
              
            })
        }
    }
}

