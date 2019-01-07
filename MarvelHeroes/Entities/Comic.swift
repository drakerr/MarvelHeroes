//
//  Comic.swift
//  MarvelHeroes
//
//  Created by Aleix on 02/01/2019.
//  Copyright © 2019 Aleix Cos. All rights reserved.
//

import Foundation

struct Comic: Decodable {
    let id: Int
    let title: String?
    let description: String?
    let thumbnail: [String:String]
    var imageUrl: String? {
        guard let imagePath = thumbnail["path"], let imageExtension = thumbnail["extension"] else {return nil}
        return imagePath + "." + imageExtension
    }
    let urls: [Url]
}
