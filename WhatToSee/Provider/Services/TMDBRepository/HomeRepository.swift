//
//  HomeRepository.swift
//  WhatToSee
//
//  Created by Andres Aleu on 4/9/23.
//

import Foundation

class HomeRepository {
    func getPopularMovies() async throws -> [ResultsPopularMoviesBO] {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=d24265d9cbfd2e4119f0539b474f7c64"
        guard let url = URL(string: urlString) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let popularMoviesModel = try JSONDecoder().decode(PopularMoviesDTO.self, from: data)
        if let popularMovies = popularMoviesModel.results {
            let movies = popularMovies.compactMap { $0.toBo() }
            return movies
//            self.movies = movies
//            print("movies --> \(self.movies)")
        } else {
            return []
        }
    }
}


