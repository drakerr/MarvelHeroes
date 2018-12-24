//
//  HeroesListTableViewCell.swift
//  MarvelHeroes
//
//  Created by Aleix on 24/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit

class HeroesListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static let identifier = String(describing: HeroesListTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureWithHeroe(_ heroe: Heroe){
        titleLabel.text = heroe.name
        subtitleLabel.text = heroe.description
    }
}
