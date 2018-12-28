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

    // PRESENTER -> VIEW
    func showHeroes(_ heroes:[Hero])
    func showHUD()
    func hideHUD()

}

protocol HeroesListRouterProtocol: class {
    static func createHeroesListModule() -> UIViewController
    // PRESENTER -> ROUTER
    func pushToHeroDetail(_ hero: Hero, from view: HeroesListViewProtocol) 
}

protocol HeroesListPresenterProtocol: class {
    var view: HeroesListViewProtocol? { get set }
    var interactor: HeroesListInteractorInputProtocol? {get set}
    var router: HeroesListRouterProtocol? { get set }

    // VIEW -> PRESENTER
    func viewDidLoad()
    func collectionScrolledBottom()
    func showHeroDetail(_ hero: Hero)

}

protocol HeroesListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveHeroes(_ heroes: [Hero])
   // func onError()
}

protocol HeroesListInteractorInputProtocol: class {
    var presenter: HeroesListInteractorOutputProtocol? { get set }
    var networkManager: NetworkManagerProtocol? { get set }
    //var remoteDatamanager: PostListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveHeroesList()
}
