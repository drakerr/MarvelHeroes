//
//  NetworkManagerProtocols.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation

typealias HeroesListHandler = ([Hero]) -> Void
typealias HeroComicsHandler = ([Comic]) -> Void

protocol NetworkManagerProtocol{
    func getHeroesList(_ completion: @escaping HeroesListHandler)
    func getHeroComics(id: Int, completion: @escaping HeroComicsHandler)

}
