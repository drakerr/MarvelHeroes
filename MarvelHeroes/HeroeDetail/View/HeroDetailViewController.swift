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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingIndicator)
        presenter?.viewDidLoad()
        comicsCollectionView.dataSource = self
        comicsCollectionView.delegate = self
        comicsCollectionView.register(UINib(nibName: String(describing: HeroComicsCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: HeroComicsCollectionViewCell.identifier)
    }
    
    @IBAction func visitWikiButtonClicked(_ sender: Any) {
        guard let url = URL(string: (presenter?.getHeroWikiUrl())!) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension HeroDetailViewController: HeroDetailViewProtocol{
    func showDownloadError(_ error: NetworkError) {
        noComicsAvailableLabel.isHidden = false
        noComicsAvailableLabel.text = error.description
    }
    
    func showHUD() {
        loadingIndicator.startAnimating()
    }
    
    func hideHUD() {
        loadingIndicator.stopAnimating()
    }
    
    func showComics(_ comics: [Comic]) {
        noComicsAvailableLabel.isHidden = true
        comicsCollectionView.reloadData()
    }
    
    func showHeroDetail(_ hero: Hero) {
        title = hero.name
        nameLabel.text = hero.name
        descriptionLabel.text = hero.description
        descriptionView.isHidden = hero.description.isEmpty
        comicsTitleLabel.text = "Appears in \(hero.comics.available) comics"
        comicsView.isHidden = (hero.comics.available == 0)
        if let imageUrl = hero.imageUrl{
            heroImageView.kf.setImage(with: URL(string: imageUrl))
        }
        wikiButton.isHidden = presenter?.getHeroWikiUrl().isEmpty ?? true

    }
}

extension HeroDetailViewController: UICollectionViewDataSource{    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItemsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let comic = presenter?.comicAt(indexPath: indexPath) else {return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroComicsCollectionViewCell.identifier, for: indexPath) as! HeroComicsCollectionViewCell
        cell.configureCellWithComic(comic)
        return cell
    }
}

extension HeroDetailViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (presenter?.shoudLoadMoreComicsAt(indexPath: indexPath) ?? false) {
            presenter?.retrieveComicsWithOffset(indexPath.item + 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let comic = presenter?.comicAt(indexPath: indexPath) else {return}
        for url in comic.urls where url.enumType == .detail {
            guard let comicUrl = URL(string: url.url) else { return }
            UIApplication.shared.open(comicUrl, options: [:], completionHandler: nil)
        }
    }
}
