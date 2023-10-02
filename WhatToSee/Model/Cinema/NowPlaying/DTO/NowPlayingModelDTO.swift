//
//  NowPlayingModelDTO.swift
//  WhatToSee
//
//  Created by Andres Aleu on 2/10/23.
//

import Foundation

struct NowPlayingModelDTO: Codable {
    let dates: NowPlayingDatesDTO?
    let page: Int?
    let results: [ResultsNowPlayingDTO]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct NowPlayingDatesDTO: Codable {
    let maximum: String?
    let minimum: String?
}

struct ResultsNowPlayingDTO: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let id: Int?
    let originalLanguaje: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Double?
    
    enum CodingKeys:  String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguaje = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
