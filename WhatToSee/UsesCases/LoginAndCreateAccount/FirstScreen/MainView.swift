//
//  MainView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 16/8/23.
//

import SwiftUI

struct MainView: View {
    //Detecta configuracion de modo oscuro o claro del iPhone
    @Environment(\.colorScheme) var colorScheme
    
    //ViewModel
    @ObservedObject var viewModel: FirstScreenViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo-app")
                NavigationLink("Inicia Sesion", destination: LoginView())
                    .frame(width: 370, height: 50)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                
                NavigationLink("Crear Cuenta", destination: CreateAccountView())
                    .frame(width: 370, height: 50)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(10)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: FirstScreenViewModel())
        MainView(viewModel: FirstScreenViewModel())
            .previewDevice("iPhone 14")
            
    }
}
