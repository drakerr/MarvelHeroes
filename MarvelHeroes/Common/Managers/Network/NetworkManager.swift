//
//  NetworkManager.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import Foundation
import Alamofire
import CommonCrypto

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
        
    func getHeroesList(offset: Int, completion: @escaping HeroesListHandler) {
        let url = Endpoints.marvelBaseEndPoint + Endpoints.marvelCharactersEndPoint
        AF.request(url, parameters: getRequestParameters(offset: offset)).responseDecodable { (response: DataResponse<HeroesListResponseModel>) in
            guard let heroes = response.value?.data.results else{
                completion([], .DecodingDataError)
                return
            }
            completion(heroes, nil)
        }
    }
    
    func getHeroComics(id: Int, offset: Int, completion: @escaping HeroComicsHandler){
        let comicsEndPoint = String(format: Endpoints.marvelCharacterComicsEndPoint, id)
        let url = Endpoints.marvelBaseEndPoint + comicsEndPoint
        AF.request(url, parameters: getRequestParameters(offset: offset)).responseDecodable { (response: DataResponse<HeroComicsResponseModel>) in
            guard let comics = response.value?.data.results else {
                completion([], .DecodingDataError)
                return
            }
            completion(comics, nil)
        }
    }
    
    private let timestamp = NSDate().timeIntervalSince1970.description
    private func getRequestParameters(offset: Int) -> Parameters{
        let params: Parameters = [
            "apikey": Constants.marvelPublicApiKey,
            "ts": timestamp,
            "hash": (timestamp + Constants.marvelPrivateApiKey + Constants.marvelPublicApiKey).MD5,
            "offset" : offset
        ]
        return params
    }
}

fileprivate extension String {
    var MD5:String {
        get{
            let messageData = self.data(using:.utf8)!
            var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
            
            _ = digestData.withUnsafeMutableBytes {digestBytes in
                messageData.withUnsafeBytes {messageBytes in
                    CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
                }
            }
            return digestData.map { String(format: "%02hhx", $0) }.joined()
        }
    }
}
