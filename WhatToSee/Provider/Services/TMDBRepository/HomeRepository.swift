//
//  HomeRepository.swift
//  WhatToSee
//
//  Created by Andres Aleu on 4/9/23.
//

import Foundation

class HomeRepository {
    func getPopularMovies() async throws -> [ResultsPopularMoviesBO] {
        guard let url = Util.Services.PopularMovie.shapeURLHome() else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let popularMoviesModel = try JSONDecoder().decode(PopularMoviesDTO.self, from: data)
        if let popularMovies = popularMoviesModel.results {
            let movies = popularMovies.compactMap { $0.toBo() }
            return movies
        } else {
            return []
        }
    }
    
    func getGenresMovies() async throws -> [ListGenresMoviesModelDTO] {
        guard let url = Util.Services.genresMovie.shapeURLHome() else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let genresMoviesModel = try JSONDecoder().decode(GenreMoviesModelDTO.self, from: data)
        if let genresMovies = genresMoviesModel.genres {
            return genresMovies
        } else {
            return []
        }
    }
    
    func getTopRatedMovies() async throws -> [ResultsTopRatedMoviesBO] {
        guard let url = Util.Services.topRatedMovie.shapeURLHome() else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let popularMoviesModel = try JSONDecoder().decode(TopRatedMoviesDTO.self, from: data)
        if let popularMovies = popularMoviesModel.results {
            let movies = popularMovies.compactMap { $0.toBo() }
            return movies
        } else {
            return []
        }
    }
}


