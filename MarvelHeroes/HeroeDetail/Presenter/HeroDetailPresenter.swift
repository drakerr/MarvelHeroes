//
//  HeroDetailPresenter.swift
//  MarvelHeroes
//
//  Created by Aleix on 28/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

class HeroDetailPresenter: HeroDetailPresenterProtocol{
    weak var view: HeroDetailViewProtocol?
    var router: HeroDetailRouterProtocol?
    var hero: Hero?
    
    func viewDidLoad() {
        view?.showHeroDetail(hero!)
    }
    
    
}
