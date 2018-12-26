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
    
    @IBOutlet weak var collectionView: HeroesListCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HeroesListViewController: HeroesListViewProtocol{
    func showHeroes(_ heroes: [Heroe]) {
        collectionView.heroesList = heroes
        collectionView.reloadData()
    }
}
