//
//  HomeViewModel.swift
//  WhatToSee
//
//  Created by Andres Aleu on 18/8/23.
//

import Foundation

 class HomeViewModel: ObservableObject {
    
     @Published var popularMovies: [ResultsPopularMoviesBO] = []
     let repository: HomeRepository = HomeRepository()
     
     
     
     func loadUI() {
         Task {
             await loadData()
         }
     }
     
     @MainActor
     func loadData() async  {
         do {
             popularMovies = try await repository.getPopularMovies()
         } catch (let err) {
             print(err)
         }
    }
}
