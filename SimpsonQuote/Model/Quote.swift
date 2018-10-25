//
//  Quote.swift
//  SimpsonQuote
//
//  Created by Xavier on 10/25/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import Foundation

struct Quote: Decodable {
    var name: String
    var quote: String
    var imageURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case name = "character"
        case quote
       case imageURL = "image"
    }
}
