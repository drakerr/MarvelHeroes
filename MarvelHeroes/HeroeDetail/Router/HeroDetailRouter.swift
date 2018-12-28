//
//  HeroDetailRouter.swift
//  MarvelHeroes
//
//  Created by Aleix on 28/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit

class HeroDetailRouter: HeroDetailRouterProtocol {
    class func createHeroDetailModule(forHero hero: Hero) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HeroDetailViewController")
        if let view = viewController as? HeroDetailViewController {
            let presenter: HeroDetailPresenterProtocol = HeroDetailPresenter()
            let router: HeroDetailRouterProtocol = HeroDetailRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.hero = hero
            presenter.router = router
            
            return viewController
        }
        return UIViewController()

    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
