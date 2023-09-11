//
//  Util.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import Foundation

final class Util {
    //MARK: - Obtener apikey de info.plist
    static func getApiKey() -> String {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        guard let key = apiKey else {
            return "No existe"
        }
        return key
    }
    
    enum Services {
        case PopularMovie
        case genresMovie
        case topRatedMovie
        
        func shapeURLHome() -> URL? {
            switch self {
                case .PopularMovie:
                    return URL(string: "\(Constants.TMDBuri)\(Constants.popularMovies)\(Constants.apiKey)")
                case .genresMovie:
                    return URL(string: "\(Constants.TMDBuri)\(Constants.genresMovies)\(Constants.apiKey)")
                case .topRatedMovie:
                    return URL(string: "\(Constants.TMDBuri)\(Constants.topRatedMovies)\(Constants.apiKey)")
            }
        }
    }
}
