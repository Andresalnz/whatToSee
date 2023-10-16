//
//  CinemaView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import SwiftUI

struct CinemaView: View {
    
    @StateObject var viewModel: CinemaViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Proximamente en cines")
                    .font(.title)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.upcomingCinema, id: \.id) { movie in
                            UpcomingRowView(movieUpcoming: movie)
                                .frame(width: 300, height: 400)
                        }
                    }
                }
                //MARK: - Cartelera
                Text("Cartelera")
                    .font(.title)
                VStack(spacing: 20) {
                    ForEach(viewModel.nowPlayingCinema, id: \.id) { movie in
                        NowPlayingRowView(movieNowPlaying: movie)
                    }
                }
            }
            .padding(.horizontal, 20)
            .onAppear {
                viewModel.loadUI()
            }
        }
    }
}

struct CinemaView_Previews: PreviewProvider {
    static var previews: some View {
        CinemaView(viewModel: CinemaViewModel())
    }
}
