//
//  HeroDetailInteractor.swift
//  MarvelHeroes
//
//  Created by Aleix on 02/01/2019.
//  Copyright © 2019 Aleix Cos. All rights reserved.
//

import Foundation

class HeroDetailInteractor: HeroDetailInteractorInputProtocol{
    weak var presenter: HeroDetailInteractorOutputProtocol?
    var networkManager: NetworkManagerProtocol?
    
    func retrieveHeroComics(id: Int, offset: Int) {
        networkManager?.getHeroComics(id: id, offset: offset, completion: { [weak self] comics in
            self?.presenter?.didRetrieveComicList(comics)
        })
    }
}
