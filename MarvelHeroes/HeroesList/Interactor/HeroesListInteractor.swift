//
//  HeroesListInteractor.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation

class HeroesListInteractor: HeroesListInteractorInputProtocol{
    weak var presenter: HeroesListInteractorOutputProtocol?
    var networkManager: NetworkManagerProtocol?
    
    func retrieveHeroesList() {
        networkManager?.request(Constants.marvelBaseEndPoint + Constants.marvelCharactersEndPoint)
        presenter?.didRetrieveHeroes()
    }
    
    
}
