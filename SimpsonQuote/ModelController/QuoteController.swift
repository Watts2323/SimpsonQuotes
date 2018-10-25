//
//  QuoteController.swift
//  SimpsonQuote
//
//  Created by Xavier on 10/25/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class QuoteController {
    
    static let baseURL = URL(string: "https://thesimpsonsquoteapi.glitch.me/quotes")
    
    static func fetchCharacters(completion: @escaping ([Quote]?) -> Void) {
        
        //Step 1 - Construct URL
        guard let baseURL = baseURL else { completion(nil); return}
        
        //Need components since we are creating query items
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        //Create queryitem
        let quoteQueryItem = URLQueryItem(name: "count", value: "10")
        components?.queryItems = [quoteQueryItem]
        
        guard let url = components?.url else {completion(nil); return}
        print(url)
        
        //Step2 URL Request- Skip not needed
        
        //Step 3 - Datatask + RESUME
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            let decoder = JSONDecoder()
            do{
                let quotes = try decoder.decode([Quote].self, from: data)
                completion(quotes)
            } catch {
                print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
                completion(nil); return
            }
        }.resume()
        
    }
    static func fetchImage(with quote: Quote, completion: @escaping (UIImage?) -> Void) {
        
        //Step 1 - construct URL
        guard let url = quote.imageURL else {completion(nil); return}
        
        //STEP 2 - SKIP Not needed
        
        //Step 3 DataTask + RESUME
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
                completion(nil); return
            }
            guard let data = data else {completion(nil); return}
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}
