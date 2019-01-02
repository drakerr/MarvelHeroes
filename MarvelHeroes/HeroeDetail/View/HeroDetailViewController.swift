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
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    
    
    var presenter: HeroDetailPresenterProtocol?
    var wikiUrl: String?
    lazy var comics = [Comic]()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        comicsCollectionView.dataSource = self
        comicsCollectionView.register(UINib(nibName: String(describing: HeroesListCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: HeroesListCollectionViewCell.identifier)

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
    func showComics(_ comics: [Comic]) {
        self.comics += comics
        comicsCollectionView.reloadData()
    }
    
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

extension HeroDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let comic = comics[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesListCollectionViewCell.identifier, for: indexPath) as! HeroesListCollectionViewCell
        if let imageUrl = comic.imageUrl{
            cell.imageView.kf.setImage(with: URL(string:imageUrl))
        }
        return cell
    }
}
