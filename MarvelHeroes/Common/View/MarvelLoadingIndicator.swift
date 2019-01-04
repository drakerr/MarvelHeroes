//
//  MarvelLoadingIndicator.swift
//  MarvelHeroes
//
//  Created by Aleix on 04/01/2019.
//  Copyright © 2019 Aleix Cos. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class MarvelLoadingIndicator: UIView {
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    
    private let width: CGFloat = 64
    private let height: CGFloat = 64
    private let topBarHeight: CGFloat = 64

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
        
    private func customInit(){
        Bundle.main.loadNibNamed(String(describing: MarvelLoadingIndicator.self), owner: self, options: nil)
        addSubview(containerView)
        let frame = CGRect(x: UIScreen.main.bounds.width/2 - width/2, y: UIScreen.main.bounds.height/2 - height/2 - topBarHeight, width: width, height: height)
        containerView.frame = frame
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let gif = UIImage.gif(name: "marvel_loading_indicator")
        gifImageView.animationImages = gif?.images
        gifImageView.animationDuration = (gif?.duration)! / 2
    }
    
    func startAnimating(){
        gifImageView.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopAnimating(){
        gifImageView.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
