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
    @IBOutlet weak var wikiButton: UIButton!
    
    var presenter: HeroDetailPresenterProtocol?
    var wikiUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func visitWikiButtonClicked(_ sender: Any) {
        guard let url = URL(string: wikiUrl!) else {
            return //be safe
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }

    }
}

extension HeroDetailViewController: HeroDetailViewProtocol{
    func getHeroWikiUrl(_ url: String?) {
        if let url = url {
            wikiUrl = url
        } else {
            wikiButton.isHidden = true
        }
    }
    
    func showHeroDetail(_ hero: Hero) {
        nameLabel.text = hero.name
        descriptionLabel.text = hero.description
        if let imageUrl = hero.imageUrl{
            heroImageView.kf.setImage(with: URL(string: imageUrl))
        }
    }
}
