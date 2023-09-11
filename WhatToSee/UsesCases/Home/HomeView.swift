//
//  HomeView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 18/8/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack() {
            ScrollView() {
                Text("Movies Popular")
                    .font(.title)
                ForEach(viewModel.orderMovies.sorted(by: { $0.key < $1.key }), id: \.key) { elementDictionaryMovies in
                    Text("\(elementDictionaryMovies.key)")
                        .font(.title2)
                        .padding(.top,20)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(elementDictionaryMovies.value, id: \.id) { movie in
                                PopularMovieRow(moviePopular: movie)
                            }
                        }
                    }
                }
                NavigationView {
                    List(viewModel.topRatedMovies, id: \.id) { movie in
                        TopRatedMovieRow(movieTopRated: movie)
                            .navigationTitle("Pelicula mejor valoradas")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                .padding(.top,50)
                .listStyle(.plain)
            }
        }
        .onAppear {
            viewModel.loadUI()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
