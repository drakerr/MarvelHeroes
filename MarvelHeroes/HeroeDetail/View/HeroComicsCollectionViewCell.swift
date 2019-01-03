//
//  HeroComicsCollectionViewCell.swift
//  MarvelHeroes
//
//  Created by Aleix on 03/01/2019.
//  Copyright © 2019 Aleix Cos. All rights reserved.
//

import UIKit
import Kingfisher

class HeroComicsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = String(describing: HeroComicsCollectionViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCellWithComic(_ comic: Comic){
        titleLabel.text = comic.title
        if let imageUrl = comic.imageUrl {
            imageView.kf.setImage(with: URL(string: imageUrl))
        }
    }
}
