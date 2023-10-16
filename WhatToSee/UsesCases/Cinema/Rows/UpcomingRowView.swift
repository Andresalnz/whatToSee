//
//  UpcomingRowView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 16/10/23.
//

import SwiftUI

struct UpcomingRowView: View {
    
    var movieUpcoming: ResultsUpcomingBO?
    
    var body: some View {
        if let poster  = movieUpcoming?.posterPath {
            AsyncImage(url: URL(string: "\(Constants.buildImage)\(poster)")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    UpcomingRowView(movieUpcoming: ResultsUpcomingBO(adult: false, backdropPath: nil, genreIds: nil, id: 1, originalLanguaje: "Megalodon", originalTitle: "Quanntumania", overview: "", popularity: 23.3, posterPath: URL(string: "https://image.tmdb.org/t/p/w500/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg"), releaseDate: "", title: "", video: true, voteAverage: 9.9, voteCount: 9.9))
}
