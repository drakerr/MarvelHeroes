//
//  Heroe.swift
//  MarvelHeroes
//
//  Created by Aleix on 24/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation

struct Hero: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: [String:String]
    var imageUrl: String? {
        guard let imagePath = thumbnail["path"], let imageExtension = thumbnail["extension"] else {return nil}
        return imagePath + "." + imageExtension
    }
    let urls: [Url]
}

struct Url: Decodable {
    let type: String
    let url: String
    var enumType: UrlType {
        let urlType = UrlType(rawValue: type)
        return urlType ?? . detail
    }
    
    
    enum UrlType: String, Decodable {
        init?(string: String) {
            switch string.lowercased() {
            case "wiki": self = .wiki
            case "detail": self = .detail
            default: return nil
            }
        }
        case wiki
        case detail

    }

}


