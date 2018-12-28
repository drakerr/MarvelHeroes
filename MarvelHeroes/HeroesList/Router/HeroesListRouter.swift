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
            return UINavigationController(rootViewController: view)
        }
        
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func goToDetail() -> UIViewController {
        
    }
    
    
}
