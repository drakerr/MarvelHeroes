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

    func showHeroDetail(_ hero: Hero)
    func showComics(_ comics: [Comic])
    func showHUD()
    func hideHUD()
    func showDownloadError(_ error: NetworkError)
}

protocol HeroDetailRouterProtocol: class {
    static func createHeroDetailModule(forHero hero: Hero) -> UIViewController
}

protocol HeroDetailPresenterProtocol: class {
    var view: HeroDetailViewProtocol? { get set }
    var router: HeroDetailRouterProtocol? { get set }
    var interactor: HeroDetailInteractorInputProtocol? {get set}
    var hero: Hero? { get set }

    func viewDidLoad()
    func retrieveComicsWithOffset(_ offset: Int)
    func shoudLoadMoreComicsAt(indexPath: IndexPath) -> Bool
    func numberOfItemsInSection() -> Int
    func comicAt(indexPath: IndexPath) -> Comic
    func getHeroWikiUrl() -> String
}

protocol HeroDetailInteractorOutputProtocol: class {
    func didRetrieveComicList(_ comics: [Comic])
    func didFailureRetrivingComics(error: NetworkError)
}

protocol HeroDetailInteractorInputProtocol: class {
    var presenter: HeroDetailInteractorOutputProtocol? { get set }
    var networkManager: NetworkManagerProtocol? { get set }
    
    func retrieveHeroComics(id: Int, offset: Int)
}
