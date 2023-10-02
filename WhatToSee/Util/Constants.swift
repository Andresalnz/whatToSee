//
//  Constants.swift
//  WhatToSee
//
//  Created by Andres Aleu on 9/9/23.
//

import Foundation

struct Constants {
    
    static let buildImage: String = "https://image.tmdb.org/t/p/w500"
    static let TMDBuri: String = "https://api.themoviedb.org/3/"
    static let popularMovies: String = "movie/popular"
    static let topRatedMovies: String = "movie/top_rated"
    static let genresMovies: String = "genre/movie/list"
    static let apiKey: String = "?api_key=\(Util.getApiKey())"
    static let upcoming: String = "movie/upcoming"
    static let nowPlaying: String = "movie/now_playing"
}
