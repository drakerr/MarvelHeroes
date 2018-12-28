//
//  UIView+Extensions.swift
//  MarvelHeroes
//
//  Created by Aleix on 28/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit

extension UIView {
    func roundedBy(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
