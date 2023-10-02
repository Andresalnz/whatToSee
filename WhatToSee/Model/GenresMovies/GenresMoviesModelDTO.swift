//
//  GenresMoviesModelDTO.swift
//  WhatToSee
//
//  Created by Andres Aleu on 2/9/23.
//

import Foundation

struct GenreMoviesModelDTO: Codable {
    let genres: [ListGenresMoviesModelDTO]?
}

struct ListGenresMoviesModelDTO: Codable {
    let id: Int?
    let name: String?
}

