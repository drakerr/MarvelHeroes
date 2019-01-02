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
        retrieveComics()
    }
    
    func retrieveComics(){
        interactor?.retrieveHeroComics(id: hero!.id)
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
    }
    
}
