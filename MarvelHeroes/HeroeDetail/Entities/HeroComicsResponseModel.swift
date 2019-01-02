//
//  HeroDetailResponseModel.swift
//  MarvelHeroes
//
//  Created by Aleix on 02/01/2019.
//  Copyright © 2019 Aleix Cos. All rights reserved.
//

import Foundation

struct HeroComicsResponseModel: Decodable {
    let data: ComicData
}

struct ComicData: Decodable{
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Comic]
}
