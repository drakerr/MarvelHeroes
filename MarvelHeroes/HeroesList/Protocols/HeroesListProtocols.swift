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
}

protocol HeroesListRouterProtocol: class {
    static func createHeroesListModule() -> UIViewController
    // PRESENTER -> ROUTER
   // func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel)
}

protocol HeroesListPresenterProtocol: class {
    var view: HeroesListViewProtocol? { get set }
    var interactor: HeroesListInteractorInputProtocol? {get set}
    var router: HeroesListRouterProtocol? { get set }

    // VIEW -> PRESENTER
    func viewDidLoad()
}

protocol HeroesListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveHeroes()
   // func onError()
}

protocol HeroesListInteractorInputProtocol: class {
    var presenter: HeroesListInteractorOutputProtocol? { get set }
    var networkManager: NetworkManagerProtocol? { get set }
    //var remoteDatamanager: PostListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveHeroesList()
}
