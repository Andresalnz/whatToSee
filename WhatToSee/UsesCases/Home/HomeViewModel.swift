//
//  HomeViewModel.swift
//  WhatToSee
//
//  Created by Andres Aleu on 18/8/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var popularMovies: [ResultsPopularMoviesBO] = []
    @Published var genresMovies: [ListGenresMoviesModelDTO] = []
    @Published var topRatedMovies: [ResultsTopRatedMoviesBO] = []
    @Published var orderMovies: [String: [ResultsPopularMoviesBO]] = [:]
    
    var moviesForDictionary: [ResultsPopularMoviesBO] = []
    
    
    let repository: HomeRepository = HomeRepository()
    
    func sortMoviesByGenres()  {
        for (_, genre) in genresMovies.enumerated() {
            for movie in popularMovies {
                if movie.genreIds?.contains(genre.id!) == true {
                    moviesForDictionary.append(movie)
                }
            }
            
            if !moviesForDictionary.isEmpty {
                orderMovies[genre.name!] = moviesForDictionary
                moviesForDictionary.removeAll()
            }
        }
    }
    
    func loadUI() {
        Task {
            await loadData()
        }
    }
    
    @MainActor
    func loadData() async  {
        do {
            popularMovies = try await repository.getPopularMovies()
            genresMovies = try await repository.getGenresMovies()
            topRatedMovies = try await repository.getTopRatedMovies()
            sortMoviesByGenres()
        } catch (let err) {
            print(err)
        }
    }
}
