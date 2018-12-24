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
    
    func getHeroesList(_ completion: @escaping HeroesListHandler) {
        let url = Constants.marvelBaseEndPoint + Constants.marvelCharactersEndPoint
        AF.request(url, parameters: getRequestParameters()).responseDecodable { (response: DataResponse<HeroesListResponseModel>) in
            guard let heroes = response.value?.data.results else { return}
            completion(heroes)
        }
    /*    AF.request(url, parameters: getRequestParameters()).responseJSON { response in
            /* if let json = response.result.value {
             
             completion(json)
             }*/
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                let photoObject = try? JSONDecoder().decode(HeroesListResponseModel.self, from: data)
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }*/
    }

    let ts = NSDate().timeIntervalSince1970.description
    
    func getRequestParameters() -> Parameters{
        let params: Parameters = [
            "apikey": Constants.marvelPublicApiKey,
            "ts": ts,
            "hash": (ts + Constants.marvelPrivateApiKey + Constants.marvelPublicApiKey).MD5,
            //"limit" : limit,
            // "offset" : offset,
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
