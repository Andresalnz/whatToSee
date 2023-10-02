//
//  CinemaViewModel.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import Foundation

final class CinemaViewModel: ObservableObject {
    
    @Published var upcomingCinema: [ResultsUpcomingBO] = []
    @Published var nowPlayingCinema: [ResultsNowPlayingBO] = []
    
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
            nowPlayingCinema = try await repository.getNowPlayingCinema()
        } catch (let err) {
            print(err)
        }
    }
}
