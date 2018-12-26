//
//  HeroesListCollectionViewCell.swift
//  MarvelHeroes
//
//  Created by Aleix on 26/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit
import Kingfisher

class HeroesListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = String(describing: HeroesListCollectionViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWithHeroe(_ heroe: Heroe){
        titleLabel.text = heroe.name
        if let imageUrl = heroe.imageUrl{
            imageView.kf.setImage(with: URL(string: imageUrl))
        }
    }


}
