//
//  HeroesListResponseModel.swift
//  MarvelHeroes
//
//  Created by Aleix on 24/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation

struct HeroesListResponseModel: Decodable {
    /*
     code (int, optional): The HTTP status code of the returned result.,
     status (string, optional): A string description of the call status.,
     copyright (string, optional): The copyright notice for the returned result.,
     attributionText (string, optional): The attribution notice for this result. Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API.,
     attributionHTML (string, optional): An HTML representation of the attribution notice for this result. Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API.,
     data (CharacterDataContainer, optional): The results returned by the call.,
     etag (string, optional): A digest value of the content returned by the call.
 */
    let data: CharacterData
}

struct CharacterData: Decodable{
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Heroe]
}
