//
//  NetworkManagerProtocols.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation

typealias HeroesListHandler = ([Hero], NetworkError?) -> Void
typealias HeroComicsHandler = ([Comic], NetworkError?) -> Void

protocol NetworkManagerProtocol{
    func getHeroesList(offset:Int, completion: @escaping HeroesListHandler)
    func getHeroComics(id: Int, offset:Int, completion: @escaping HeroComicsHandler)

}
