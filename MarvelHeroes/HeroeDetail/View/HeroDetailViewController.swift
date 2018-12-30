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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var presenter: HeroDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HeroDetailViewController: HeroDetailViewProtocol{
    func showHeroDetail(_ hero: Hero) {
        nameLabel.text = hero.name
        descriptionLabel.text = hero.description
        if let imageUrl = hero.imageUrl{
            heroImageView.kf.setImage(with: URL(string: imageUrl))
        }
    }
}
