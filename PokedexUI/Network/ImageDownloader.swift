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
    var urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
           self.urlSession = urlSession
       }
    
    func download(from url: URL, completion: @escaping (Data) -> Void) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        
        urlSession.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil
                else { return }
                completion(data)
        }.resume()
    }
    func download(from link: String, completion: @escaping (Data) -> Void) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        download(from: url) { img in
            completion(img)
        }
    }
}
