//
//  PopularMovieRow.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import SwiftUI

struct PopularMovieRow: View {
    
    var moviePopular: ResultsPopularMoviesBO
    
    var body: some View {
        
        VStack {
            if let poster  = moviePopular.posterPath {
                AsyncImage(url: URL(string: "\(Constants.buildImage)\(poster)")) { image in
                    image.resizable()
                        .frame(width: 300, height: 400)
                } placeholder: {
                    ProgressView()
                }
            }
            if let originalTitle = moviePopular.originalTitle {
                Text(originalTitle)
                    .font(.body)
            }
        }
    }
}

struct PopularMovieRow_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieRow(moviePopular: ResultsPopularMoviesBO(adult: false, backdropPath: nil, genreIds: nil, id: 1, originalLanguaje: "Megalodon", originalTitle: "Quanntumania", overview: "", popularity: 23.3, posterPath: URL(string: "https://image.tmdb.org/t/p/w500/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg"), releaseDate: "", title: "", video: true, voteAverage: 9.9, voteCount: 9.9))
    }
}
