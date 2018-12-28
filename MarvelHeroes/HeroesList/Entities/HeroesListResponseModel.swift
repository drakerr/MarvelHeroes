//
//  HeroesListResponseModel.swift
//  MarvelHeroes
//
//  Created by Aleix on 24/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation

struct HeroesListResponseModel: Decodable {
    let data: CharacterData
}

struct CharacterData: Decodable{
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}
