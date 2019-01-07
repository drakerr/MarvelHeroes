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
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var comicsTitleLabel: UILabel!
    @IBOutlet weak var comicsView: UIView!
    @IBOutlet weak var noComicsAvailableLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    lazy var loadingIndicator = MarvelLoadingIndicator()
    var presenter: HeroDetailPresenterProtocol?
    var wikiUrl: String?
    lazy var comics = [Comic]()
    private var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingIndicator)
        presenter?.viewDidLoad()
        comicsCollectionView.dataSource = self
        comicsCollectionView.delegate = self
        comicsCollectionView.register(UINib(nibName: String(describing: HeroComicsCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: HeroComicsCollectionViewCell.identifier)
    }
    
    @IBAction func visitWikiButtonClicked(_ sender: Any) {
        guard let url = URL(string: wikiUrl!) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension HeroDetailViewController: HeroDetailViewProtocol{
    func showHUD() {
        loadingIndicator.startAnimating()
    }
    
    func hideHUD() {
        loadingIndicator.stopAnimating()
    }
    
    func showComics(_ comics: [Comic]) {
        self.comics += comics
        noComicsAvailableLabel.isHidden = !comics.isEmpty
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
        title = hero.name
        self.hero = hero
        nameLabel.text = hero.name
        descriptionLabel.text = hero.description
        descriptionView.isHidden = hero.description.isEmpty
        comicsTitleLabel.text = "Appears in \(hero.comics.available) comics"
        comicsView.isHidden = (hero.comics.available == 0)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroComicsCollectionViewCell.identifier, for: indexPath) as! HeroComicsCollectionViewCell
        cell.configureCellWithComic(comic)
        return cell
    }
}

extension HeroDetailViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.item == comics.count - 1 && comics.count != hero?.comics.available) {
            presenter?.retrieveComicsWithOffset(comics.count)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let comic = comics[indexPath.item]
        for url in comic.urls where url.enumType == .detail {
            guard let comicUrl = URL(string: url.url) else { return }
            UIApplication.shared.open(comicUrl, options: [:], completionHandler: nil)
        }
    }
}
