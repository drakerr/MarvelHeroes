//
//  HeroesListProtocols.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit

protocol HeroesListViewProtocol: class {
    var presenter: HeroesListPresenterProtocol? { get set }

    func showHeroes(_ heroes:[Hero])
    func showDownloadError(_ error: NetworkError)
    func showHUD()
    func hideHUD()

}

protocol HeroesListRouterProtocol: class {
    static func createHeroesListModule() -> UIViewController

    func pushToHeroDetail(_ hero: Hero, from view: HeroesListViewProtocol)
}

protocol HeroesListPresenterProtocol: class {
    var view: HeroesListViewProtocol? { get set }
    var interactor: HeroesListInteractorInputProtocol? {get set}
    var router: HeroesListRouterProtocol? { get set }

    func viewDidLoad()
    func collectionWillDisplayLastCell(index: Int)
    func showHeroDetail(_ hero: Hero)
}

protocol HeroesListInteractorOutputProtocol: class {
    func didRetrieveHeroes(_ heroes: [Hero])
    func didFailureRetrivingHeroes(error: NetworkError)
}

protocol HeroesListInteractorInputProtocol: class {
    var presenter: HeroesListInteractorOutputProtocol? { get set }
    var networkManager: NetworkManagerProtocol? { get set }
    
    func retrieveHeroesList(offset: Int)
}
