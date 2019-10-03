//
//  imageDownloader.swift
//  PokedexUI
//
//  Created by Femke Offringa on 17/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import Foundation
import Combine

class ImageDownloader: ObservableObject{
    
    @Published var data = Data()
    
    init(imageURL: String, urlSession: URLSession = .shared){
        guard let url = URL(string: imageURL) else { return }
        
        urlSession.dataTask(with: url) { [weak self]
            data, response, error in
            if error == nil{
                if let data = data, data.count > 0{
                    print("We have found data!")
                    DispatchQueue.main.async {
                        self?.data = data
                    }
                }
            }else{
                print("----- Something went wrong: \(String(describing: error?.localizedDescription))")
            }
        }.resume()
    }
}
