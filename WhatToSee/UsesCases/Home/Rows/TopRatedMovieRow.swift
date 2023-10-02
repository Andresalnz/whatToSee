//
//  TopRatedMovieRow.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import SwiftUI

struct TopRatedMovieRow: View {
    
    var movieTopRated: ResultsTopRatedMoviesBO
    
    var body: some View {
        HStack {
            if let poster = movieTopRated.posterPath {
                AsyncImage(url: URL(string: "\(Constants.buildImage)\(poster)")) { image in
                    image.resizable()
                        .frame(width: 90, height: 100)
                } placeholder: {
                    ProgressView()
                }
            }
            if let originalTitle = movieTopRated.originalTitle {
                Text(originalTitle)
            }
        }
    }
}

struct TopRatedMovieRow_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedMovieRow(movieTopRated: ResultsTopRatedMoviesBO(adult: false, backdropPath: nil, genreIds: nil, id: 1, originalLanguaje: "Megalodon", originalTitle: "Quanntumania", overview: "", popularity: 23.3, posterPath: URL(string: "https://image.tmdb.org/t/p/w500/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg"), releaseDate: "", title: "", video: true, voteAverage: 9.9, voteCount: 9.9))
    }
}
