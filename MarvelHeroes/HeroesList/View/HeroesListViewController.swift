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

    @IBOutlet weak var noDataLabel: UILabel!
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
        noDataLabel.isHidden = !heroes.isEmpty
        collectionView.reloadData()
    }
}

extension HeroesListViewController: HeroesListCollectionViewDelegate{
    func willDisplayLastCell(index: Int) {
        presenter?.collectionWillDisplayLastCell(index: index)
    }
    
    func didSelectHero(_ hero: Hero) {
        presenter?.showHeroDetail(hero)
    }
}
