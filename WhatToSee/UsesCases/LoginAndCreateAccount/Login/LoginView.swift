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
                
                TextFieldView(text: $viewModel.email, prompt: Text("Correo"), keyboardType: .emailAddress, opacity: 0.3, cornerRadius: 8)
                    .padding(9)
                    .textFieldStyle(.roundedBorder)
                
                SecureFieldView(text: $viewModel.password, prompt: Text("Contraseña"), keyboardType: .default, padding: 8, paddingHorizontal: 60, opacity: 0.3, cornerRadius: 8, font: .headline)
                    .textFieldStyle(.roundedBorder)
                    
                
                HStack(alignment: .center) {
                    ButtonView(title: "Iniciar Sesión", font: .title2, foregroundColor: .white, backgroundColor: .green, cornerRadius: 8, width: 150, height: 50, action: {
                            viewModel.loginAction()
                    })
                    .padding(.top, 15)
            
                    .background(NavigationLink("", isActive: $viewModel.logged, destination: { HomeView() }))

                    ButtonView(title:"Cancelar", font: .title2, foregroundColor: .white, backgroundColor: .gray, cornerRadius: 8, width: 150, height: 50, action: {
                        viewModel.cancelAction()
                    })
                    .padding(.top, 15)
                }
                
            
                            
                HStack(alignment: .center) {
                    SeparatorWithOrView(height: 1, backgroundColor: .gray, padding: 20, text: Text("or"))
                }
                
                ButtonView(title: "Iniciar sesion con Facebook", font: .title2, foregroundColor: .white, backgroundColor: .blue, cornerRadius: 10, width: 300, height: 50) {
                    print("FACEBOOK")
                }
                
                
                ButtonView(title: "Iniciar sesion con Apple", font: .title2, foregroundColor: .white, backgroundColor: .black, cornerRadius: 10, width: 300, height: 50) {
                    print("APPLE")
                }
                
                NavigationLink("¿No tiene cuenta? Create una", destination: CreateAccountView(viewModel: viewModelCreateAccount))
                    .padding(8)
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
