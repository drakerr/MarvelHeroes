//
//  NetworkErrors.swift
//  MarvelHeroes
//
//  Created by Aleix on 09/01/2019.
//  Copyright © 2019 Aleix Cos. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case DecodingDataError
    
    var description: String {
        switch self {
        case .DecodingDataError:
            return "There was an error downloading the data. Try again later"
        }
    }
}
