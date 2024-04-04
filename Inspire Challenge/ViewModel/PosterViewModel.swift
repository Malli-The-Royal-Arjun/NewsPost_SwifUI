//
//  PosterViewModel.swift
//  Inspire Challenge
//
//  Created by Mupparaju Rao on 24/10/23.
//

import Foundation

extension ContentView{
    class PosterViewModel : ObservableObject {
        
        @Published var posterModel : [Posters] = []
        
        init() {
            self.posterModel = posterModel
            self.readJSONFile(forName: "ImportedData")
        }
        
        func readJSONFile(forName name: String) {
            do {
                // creating a path from the main bundle and getting data object from the path
                if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    
                    // Decoding the Product type from JSON data using JSONDecoder() class.
                    let product = try JSONDecoder().decode(PosterModel.self, from: jsonData)
                    self.posterModel = product.posts
                }
            } catch {
                print(error)
            }
        }
    }
}
