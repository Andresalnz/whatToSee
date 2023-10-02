//
//  NowPlayingMapper.swift
//  WhatToSee
//
//  Created by Andres Aleu on 2/10/23.
//

import Foundation

extension ResultsNowPlayingDTO {
    func toBo() -> ResultsNowPlayingBO {
        ResultsNowPlayingBO(adult: adult,
                            backdropPath: URL(string: backdropPath ?? ""),
                            genreIds: genreIds,
                            id: id,
                            originalLanguaje: originalLanguaje,
                            originalTitle: originalTitle,
                            overview: overview,
                            popularity: popularity,
                            posterPath: URL(string: posterPath ?? ""),
                            releaseDate: releaseDate,
                            title: title,
                            video: video,
                            voteAverage: voteAverage,
                            voteCount: voteCount)
    }
}
