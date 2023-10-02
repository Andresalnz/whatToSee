//
//  CinemaViewModel.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import Foundation

final class CinemaViewModel: ObservableObject {
    
    @Published var upcomingCinema: [ResultsUpcomingBO] = []
    
    var repository: CinemaRepository = CinemaRepository()
    
    func loadUI() {
        Task {
            await loadData()
        }
    }
    
    
    @MainActor
    func loadData() async {
        do {
            upcomingCinema = try await repository.getUpcomingCinema()
        } catch (let err) {
            print(err)
        }
    }
}
