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
        VStack(){
            ForEach(viewModel.popularMovies, id: \.id) { movie in
                Text(movie.title ?? "no title")
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
