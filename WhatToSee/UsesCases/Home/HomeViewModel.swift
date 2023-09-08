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
     
     var hola: [ResultsPopularMoviesBO] = []
     
     
     let repository: HomeRepository = HomeRepository()
     
     func order()  {
         var id: String = ""
         for (_,j) in genresMovies.enumerated() {
             for k in popularMovies {
                 if k.genreIds?.contains(j.id!) == true {
                     id = j.name!
                     hola.append(k)
                 }
             }
             if !hola.isEmpty {
                 orderMovies[id] = hola
                 hola.removeAll()
             }
            
         }
         print(orderMovies)
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
             order()
         } catch (let err) {
             print(err)
         }
    }
}
