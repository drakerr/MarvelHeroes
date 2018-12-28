//
//  HeroesListPresenter.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

class HeroesListPresenter: HeroesListPresenterProtocol {
    
    var router: HeroesListRouterProtocol?
    weak var view: HeroesListViewProtocol?
    var interactor: HeroesListInteractorInputProtocol?

    func viewDidLoad() {
        retrieveHeroesList()
    }
    
    func collectionScrolledBottom() {
        retrieveHeroesList()
    }
    
    func retrieveHeroesList(){
        view?.showHUD()
        interactor?.retrieveHeroesList()
    }
    
}

extension HeroesListPresenter: HeroesListInteractorOutputProtocol{
    func didRetrieveHeroes(_ heroes: [Heroe]) {
        view?.showHeroes(heroes)
        view?.hideHUD()
    }
}
