//
//  NowPlayingRowView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 16/10/23.
//

import SwiftUI

struct NowPlayingRowView: View {
    
    let movieNowPlaying: ResultsNowPlayingBO
    
    var body: some View {
        if let poster  = movieNowPlaying.posterPath {
            AsyncImage(url: URL(string: "\(Constants.buildImage)\(poster)")) { image in
                image.resizable()
                    .frame(width: 360, height: 300)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .overlay {
                        VStack() {
                            Text(movieNowPlaying.originalTitle ?? "No title")
                                .bold()
                                .background(Color.black)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 200)
                                .padding(.leading, 10)
                        }
                        .padding(.bottom, 70)
                        ButtonView(title: "Comprar entradas", font: .body, foregroundColor: .white, backgroundColor: .gray, width: 330, height: 30) {
                            print("TAP")
                        }
                        .opacity(0.8)
                        .padding(.top, 250)
                    }
            } placeholder: {
                ProgressView()
            }
            
        }
    }
}

#Preview {
    NowPlayingRowView(movieNowPlaying: ResultsNowPlayingBO(adult: false, backdropPath: nil, genreIds: nil, id: 1, originalLanguaje: "Megalodon", originalTitle: "Quanntumania", overview: "", popularity: 23.3, posterPath: URL(string: "https://image.tmdb.org/t/p/w500/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg"), releaseDate: "", title: "", video: true, voteAverage: 9.9, voteCount: 9.9))
}
