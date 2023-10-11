//
//  CinemaView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 11/9/23.
//

import SwiftUI

struct CinemaView: View {
    @StateObject var viewModel: CinemaViewModel
    
    let columns = [GridItem(.flexible())]
    
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
                    .padding(.leading ,20)
                }
                Text("Cartelera")
                    .font(.title)
                    .padding(20)
                LazyVGrid (columns: columns, spacing: 50) {
                    ForEach(viewModel.nowPlayingCinema, id: \.id) { movie in
                        if let poster  = movie.posterPath {
                            AsyncImage(url: URL(string: "\(Constants.buildImage)\(poster)")) { image in
                                    image.resizable()
                                    
                                    .frame(width: 360, height: 300)
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                    .overlay {
                                        VStack() {
                                            Text(movie.originalTitle ?? "No title")
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
            }
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
