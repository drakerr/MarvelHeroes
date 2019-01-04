//
//  HeroDetailPresenter.swift
//  MarvelHeroes
//
//  Created by Aleix on 28/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

class HeroDetailPresenter: HeroDetailPresenterProtocol{
    
    weak var view: HeroDetailViewProtocol?
    var interactor: HeroDetailInteractorInputProtocol?
    var router: HeroDetailRouterProtocol?
    var hero: Hero?
    
    func viewDidLoad() {
        view?.showHeroDetail(hero!)
        view?.getHeroWikiUrl(heroUrl())
        retrieveComicsWithOffset(0)
    }
    
    func retrieveComicsWithOffset(_ offset: Int) {
        view?.showHUD()
        interactor?.retrieveHeroComics(id: hero!.id, offset: offset)
    }

    func heroUrl() -> String?{
        for url in hero!.urls where url.enumType == .wiki {
            return url.url
        }
        return nil
    }
}

extension HeroDetailPresenter: HeroDetailInteractorOutputProtocol{
    func didRetrieveComicList(_ comics: [Comic]) {
        view?.showComics(comics)
        view?.hideHUD()
    }
    
}
