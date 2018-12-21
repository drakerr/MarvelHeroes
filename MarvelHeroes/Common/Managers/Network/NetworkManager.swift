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
    
    
    func request(_ url: String) {
        AF.request(url, parameters: getRequestParameters()).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
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
