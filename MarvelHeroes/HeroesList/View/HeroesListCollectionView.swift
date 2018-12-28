//
//  HeroesListCollectionView.swift
//  MarvelHeroes
//
//  Created by Aleix on 26/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit

protocol HeroesListCollectionViewDelegate: class {
    func willDisplayLastCell()
    func didSelectHero(_ hero: Hero)

}

class HeroesListCollectionView: UICollectionView {
    var heroesList : [Hero] = []
    weak var heroesListCVDelegate: HeroesListCollectionViewDelegate?
    
    let lineSpacing: CGFloat = 5
    let sidesInset: CGFloat = 5

    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: String(describing: HeroesListCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: HeroesListCollectionViewCell.identifier)
    }
}

extension HeroesListCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroesList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hero = heroesList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesListCollectionViewCell.identifier, for: indexPath) as! HeroesListCollectionViewCell
        cell.configureWithHeroe(hero)
        return cell
    }
    
}

extension HeroesListCollectionView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.item == heroesList.count - 1) {
            heroesListCVDelegate?.willDisplayLastCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hero = heroesList[indexPath.row]
        heroesListCVDelegate?.didSelectHero(hero)
    }
}

extension HeroesListCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = (UIScreen.main.bounds.width / 2) - lineSpacing - sidesInset
        return CGSize(width: screenWidth, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: sidesInset, bottom: 0, right: sidesInset)
    }
}
