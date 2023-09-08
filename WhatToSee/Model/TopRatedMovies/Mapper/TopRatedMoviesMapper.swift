//
//  TopRatedMoviesMapper.swift
//  WhatToSee
//
//  Created by Andres Aleu on 8/9/23.
//

import Foundation

extension ResultsTopRatedMoviesDTO {
    func toBo() -> ResultsTopRatedMoviesBO {
        return ResultsTopRatedMoviesBO(adult: adult,
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
