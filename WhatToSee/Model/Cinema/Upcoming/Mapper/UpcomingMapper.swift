//
//  UpcomingMapper.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import Foundation

extension ResultsUpcomingDTO {
    func toBo() -> ResultsUpcomingBO {
        ResultsUpcomingBO(adult: adult,
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
