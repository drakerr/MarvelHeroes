//
//  HeroesListViewController.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit
import JGProgressHUD

class HeroesListViewController: UIViewController {
    var presenter: HeroesListPresenterProtocol?
    let hud = JGProgressHUD(style: .dark)

    @IBOutlet weak var collectionView: HeroesListCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Heroes"
        hud.textLabel.text = "Loading"
        view.backgroundColor = AppColors.mainBlack
        collectionView.backgroundColor = AppColors.mainBlack

        collectionView.heroesListCVDelegate = self
        presenter?.viewDidLoad()
    }
}

extension HeroesListViewController: HeroesListViewProtocol{
    func showHUD() {
        hud.show(in: view)
    }
    
    func hideHUD() {
        hud.dismiss()
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
