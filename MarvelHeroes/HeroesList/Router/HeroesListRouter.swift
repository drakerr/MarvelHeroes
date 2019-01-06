//
//  HeroesListRouter.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit

class HeroesListRouter: HeroesListRouterProtocol{
    
    static func createHeroesListModule() -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: "HeroesListViewController") as? HeroesListViewController {
            
            let presenter: HeroesListPresenterProtocol & HeroesListInteractorOutputProtocol = HeroesListPresenter()
            let interactor: HeroesListInteractorInputProtocol = HeroesListInteractor()
            let router: HeroesListRouterProtocol = HeroesListRouter()
            let networkManager: NetworkManagerProtocol = NetworkManager.shared
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.networkManager = networkManager

            return navigationControllerForView(view)
        }
        
        return UIViewController()
    }
    
    private static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func pushToHeroDetail(_ hero: Hero, from view: HeroesListViewProtocol) {
        let heroDetail = HeroDetailRouter.createHeroDetailModule(forHero: hero)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(heroDetail, animated: true)
        }
    }
    
    private static func navigationControllerForView(_ view: UIViewController) -> UINavigationController{
        let navigation = UINavigationController(rootViewController: view)
        navigation.navigationBar.isTranslucent = false
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColors.mainWhite]
        navigation.navigationBar.tintColor = .darkGray
        return navigation
    }
}
