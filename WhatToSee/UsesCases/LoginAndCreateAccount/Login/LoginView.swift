//
//  LoginView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 17/8/23.
//

import SwiftUI

struct LoginView: View {
    //Detecta configuracion de modo oscuro o claro del iPhone
    @Environment(\.colorScheme) var colorScheme
    let viewModelCreateAccount = CreateAccountViewModel()
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("WhatToSee")
                    .font(.title)
                    .bold()
                
                Image("logo-app")
                    .resizable().scaledToFit()
                    .frame(width: 100)
                    .padding(.bottom, 15)
                
                TextField(text: $viewModel.email, prompt: Text("Correo")) {
                }
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(8)
                .font(.headline)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal, 60)
                
                
                SecureField(text: $viewModel.password , prompt: Text("Contraseña")) {
                    
                }
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(8)
                .font(.headline)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal, 60)
                
                HStack(alignment: .center) {
                        Button("Iniciar Sesión") {
                            viewModel.loginAction()
                        }
                        .padding(8)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(8)
                        .padding(.top,15)
                        .padding(.bottom,15)
                        .background(NavigationLink("", isActive: $viewModel.logged, destination: {
                            HomeView()
                        }))
                    
                    
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
                
                HStack(alignment: .center) {
                    VStack {
                        Divider()
                            .frame(height: 1)
                            .background(.gray)
                    }
                    .padding(20)
                    Text("or")
                        .font(.callout)
                        .foregroundColor(.black)
                    
                    
                    
                    VStack {
                        Divider()
                            .frame(height: 1)
                            .background(.gray)
                        
                    }
                    .padding(20)
                }
                
                Button {
                    //
                } label: {
                    Text("Iniciar sesion con Facebook")
                }
                .frame(width: 300, height: 50)
                .font(.title2)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                
                Button {
                    //
                } label: {
                    Text("Iniciar sesion con Apple")
                }
                .frame(width: 300, height: 50)
                .font(.title2)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(10)
                
                NavigationLink("¿No tiene cuenta? Create una", destination: CreateAccountView(viewModel: viewModelCreateAccount))
            }
            .padding(.bottom, 100)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
