//
//  HeroDetailProtocols.swift
//  MarvelHeroes
//
//  Created by Aleix on 28/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit

protocol HeroDetailViewProtocol: class {
    var presenter: HeroDetailPresenterProtocol? { get set }

    // PRESENTER -> VIEW
    func showHeroDetail(_ hero: Hero)
    func getHeroWikiUrl(_ url: String?)
    func showComics(_ comics: [Comic])
    func showHUD()
    func hideHUD()

}

protocol HeroDetailRouterProtocol: class {
    static func createHeroDetailModule(forHero hero: Hero) -> UIViewController
}

protocol HeroDetailPresenterProtocol: class {
    var view: HeroDetailViewProtocol? { get set }
    var router: HeroDetailRouterProtocol? { get set }
    var interactor: HeroDetailInteractorInputProtocol? {get set}
    var hero: Hero? { get set }

    // VIEW -> PRESENTER
    func viewDidLoad()
    func retrieveComicsWithOffset(_ offset: Int)

}

protocol HeroDetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveComicList(_ comics: [Comic])
    // func onError()
}

protocol HeroDetailInteractorInputProtocol: class {
    var presenter: HeroDetailInteractorOutputProtocol? { get set }
    var networkManager: NetworkManagerProtocol? { get set }
    //var remoteDatamanager: PostListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveHeroComics(id: Int, offset: Int)
}
