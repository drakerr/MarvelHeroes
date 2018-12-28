//
//  NetworkManagerProtocols.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation

typealias HeroesListHandler = ([Heroe]) -> Void

protocol NetworkManagerProtocol{
    func getHeroesList(offset: Int, completion: @escaping HeroesListHandler) 
}
