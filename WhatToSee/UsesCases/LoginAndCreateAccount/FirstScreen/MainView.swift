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
    
    var body: some View {
        VStack {
            Image("logo-app")
            Button {
                //TODO
            } label: {
                Text("Crear Cuenta".uppercased())
                    .frame(width: 370, height: 50)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
            Button {
                //TODO
            } label: {
                Text("Iniciar Sesion".uppercased())
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
        MainView()
        MainView()
            .previewDevice("iPhone 14")
            
    }
}
