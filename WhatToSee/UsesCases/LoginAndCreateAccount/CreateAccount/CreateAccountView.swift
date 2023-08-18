//
//  CreateAccountView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 17/8/23.
//

import SwiftUI

struct CreateAccountView: View {
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("¡Empecemos!")
                .font(.title)
                .bold()
                .padding()
            TextField(text: $email, prompt: Text("Nombre de usuario")) {
            }
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding(8)
            .font(.headline)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(8)
            .padding(.horizontal, 60)
            
            
            TextField(text: $email, prompt: Text("Nombre de usuario")) {
            }
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding(8)
            .font(.headline)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(8)
            .padding(.horizontal, 60)
            .padding(.top, 8)
            SecureField(text: $password, prompt: Text("Contraseña")) {
                
            }
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding(8)
            .font(.headline)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(8)
            .padding(.horizontal, 60)
            .padding(.top, 8)
            HStack(alignment: .center) {
                Button {
                    //
                } label: {
                    Text("Crear Cuenta")
                }
                .padding(8)
                .font(.title2)
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(8)
                .padding(.top,15)
                .padding(.bottom,15)
                
                Button {
                    //
                } label: {
                    Text("Cancelar")
                }
                .padding(8)
                .font(.title2)
                .foregroundColor(.white)
                .background(.gray)
                .cornerRadius(8)
                .padding(.top,15)
                .padding(.bottom,15)
            }
            
        }
        .padding(.bottom, 100)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
