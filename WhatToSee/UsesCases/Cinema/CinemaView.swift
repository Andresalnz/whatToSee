//
//  CinemaView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import SwiftUI

struct CinemaView: View {
    @StateObject var viewModel: CinemaViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Proximamente en cines")
                    .font(.title)
                    .padding(12)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.upcomingCinema, id: \.id) { movie in
                            if let poster  = movie.posterPath {
                                AsyncImage(url: URL(string: "\(Constants.buildImage)\(poster)")) { image in
                                    image.resizable()
                                        .frame(width: 300, height: 400)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
                Text("Cartelera")
                    .font(.title)
                    .padding(20)
                LazyVGrid (columns: columns, spacing: 50) {
                    ForEach(viewModel.nowPlayingCinema, id: \.id) { movie in
                        if let poster  = movie.posterPath {
                            AsyncImage(url: URL(string: "\(Constants.buildImage)\(poster)")) { image in
                                image.resizable()
                                    .frame(width: 100, height: 150)
                                ButtonView(title: "Comprar entradas", font: .body, foregroundColor: .black, backgroundColor: .gray, width: 150, height: 30) {
                                    print("TAP")
                                }
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        
                    }
                    
                }
            }
            .padding(.bottom, 200)
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
