//
//  HomeView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 18/8/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    let buildImage: URL? = URL(string: "https://image.tmdb.org/t/p/w500")
    var body: some View {
        
        VStack(){
            Text("Home")
                .font(.title)
            ScrollView() {
                Text("Movies Popular")
                    .font(.title)
                ForEach(viewModel.orderMovies.sorted(by: { $0.key < $1.key }), id: \.key) { elemento in
                    Text("\(elemento.key)")
                        .font(.title2)
                        .padding(.top,20)
                    ScrollView(.horizontal) {
                        HStack() {
                            ForEach(elemento.value, id: \.id) { elemento2 in
                                
                                VStack {
                                    AsyncImage(url: URL(string: "\(buildImage!)\(elemento2.posterPath!)")) { image in
                                        image.resizable()
                                            .frame(width: 300, height: 400)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(elemento2.originalTitle!)
                                        .font(.body)
                                }
                            }
                        }
                        
                    }
                }
                
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
