//
//  HeroesListViewController.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit

class HeroesListViewController: UIViewController {
    var presenter: HeroesListPresenterProtocol?
    lazy var loadingIndicator = MarvelLoadingIndicator()

    @IBOutlet weak var collectionView: HeroesListCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        title = "Heroes"
        collectionView.heroesListCVDelegate = self
        view.addSubview(loadingIndicator)
        presenter?.viewDidLoad()
    }
}

extension HeroesListViewController: HeroesListViewProtocol{
    func showHUD() {
        loadingIndicator.startAnimating()
    }
    
    func hideHUD() {
        loadingIndicator.stopAnimating()
    }
    
    func showHeroes(_ heroes: [Hero]) {
        collectionView.heroesList += heroes
        collectionView.reloadData()
    }
}

extension HeroesListViewController: HeroesListCollectionViewDelegate{
    func willDisplayLastCell() {
        presenter?.collectionScrolledBottom()
    }
    
    func didSelectHero(_ hero: Hero) {
        presenter?.showHeroDetail(hero)
    }
}
