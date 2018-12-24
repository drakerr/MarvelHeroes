//
//  Heroe.swift
//  MarvelHeroes
//
//  Created by Aleix on 24/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation

struct Heroe: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: [String:String]
}
