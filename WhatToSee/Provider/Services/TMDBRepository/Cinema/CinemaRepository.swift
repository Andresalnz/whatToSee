//
//  UpcomingRepository.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import Foundation

class CinemaRepository {
    func getUpcomingCinema() async throws -> [ResultsUpcomingBO] {
        guard let url = Util.Services.upcoming.shapeURLHome() else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let upcomingMoviesModel = try JSONDecoder().decode(UpcomingModelDTO.self, from: data)
        if let upcomingMovies = upcomingMoviesModel.results {
            let movies = upcomingMovies.compactMap { $0.toBo() }
            return movies
        } else {
            return []
        }
    }
    
    func getNowPlayingCinema() async throws -> [ResultsNowPlayingBO] {
        guard let url = Util.Services.nowPlaying.shapeURLHome() else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let nowPlayingMoviesModel = try JSONDecoder().decode(NowPlayingModelDTO.self, from: data)
        if let nowPlayingMovies = nowPlayingMoviesModel.results {
            let movies = nowPlayingMovies.compactMap { $0.toBo() }
            return movies
        } else {
            return []
        }
    }
}
