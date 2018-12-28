//
//  HeroDetailViewController.swift
//  MarvelHeroes
//
//  Created by Aleix on 28/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit
import Kingfisher

class HeroDetailViewController: UIViewController {
    @IBOutlet weak var heroImageView: UIImageView!
    
    var presenter: HeroDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HeroDetailViewController: HeroDetailViewProtocol{
    func showHeroDetail(_ hero: Hero) {
        if let imageUrl = hero.imageUrl{
            heroImageView.kf.setImage(with: URL(string: imageUrl))
        }
    }
}
