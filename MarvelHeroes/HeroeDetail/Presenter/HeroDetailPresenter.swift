//
//  HeroDetailPresenter.swift
//  MarvelHeroes
//
//  Created by Aleix on 28/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation

class HeroDetailPresenter: HeroDetailPresenterProtocol{
    weak var view: HeroDetailViewProtocol?
    var interactor: HeroDetailInteractorInputProtocol?
    var router: HeroDetailRouterProtocol?
    var hero: Hero?
    
    private lazy var comics = [Comic]()

    func viewDidLoad() {
        view?.showHeroDetail(hero!)
        retrieveComicsWithOffset()
    }
    
    func retrieveComicsWithOffset(_ offset: Int = 0) {
        view?.showHUD()
        interactor?.retrieveHeroComics(id: hero!.id, offset: offset)
    }

    func getHeroWikiUrl() -> String{
        for url in hero!.urls where url.enumType == .wiki {
            return url.url
        }
        return ""
    }
    
    func shoudLoadMoreComicsAt(indexPath: IndexPath) -> Bool {
        return (indexPath.item == comics.count - 1 && comics.count != hero?.comics.available)
    }
    
    func numberOfItemsInSection() -> Int {
        return comics.count
    }
    
    func comicAt(indexPath: IndexPath) -> Comic {
        return comics[indexPath.item]
    }


}

extension HeroDetailPresenter: HeroDetailInteractorOutputProtocol{
    func didFailureRetrivingComics(error: NetworkError) {
        view?.showDownloadError(error)
        view?.hideHUD()
    }
    
    func didRetrieveComicList(_ comics: [Comic]) {
        self.comics += comics
        view?.showComics(self.comics)
        view?.hideHUD()
    }
    
}
