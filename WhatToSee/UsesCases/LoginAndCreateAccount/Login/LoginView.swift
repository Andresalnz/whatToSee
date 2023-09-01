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
                
                TextFieldView(text: $viewModel.email, prompt: Text("Correo"), keyboardType: .emailAddress, font: .headline, widthFrame: 300, heightFrame: 40)
                    .textFieldStyle(.roundedBorder)
                
                SecureFieldView(text: $viewModel.password, prompt: Text("Contraseña"), keyboardType: .default, font: .headline, widthFrame: 300, heightFrame: 40)
                    .textFieldStyle(.roundedBorder)
                    
                
                HStack(alignment: .center) {
                    ButtonView(title: "Iniciar Sesión", font: .title2, foregroundColor: .white, backgroundColor: .green,  width: 150, height: 50, action: {
                            viewModel.loginAction()
                    })
                    
                    .cornerRadius(8)
                    .alert("", isPresented: $viewModel.alertError, actions: {
                        Button("¡De acuerdo!") {
                            viewModel.cancelAction()
                        }
                    }, message: {
                        Text(viewModel.error.uppercased())
                    })
                    .background(NavigationLink("", isActive: $viewModel.logged, destination: { HomeView() }))
                    

                    ButtonView(title:"Cancelar", font: .title2, foregroundColor: .white, backgroundColor: .gray, width: 150, height: 50, action: {
                        viewModel.cancelAction()
                    })
                    .cornerRadius(8)
                }
                
            
                            
                HStack(alignment: .center) {
                    SeparatorWithOrView(height: 1, backgroundColor: .gray, padding: 20, text: Text("or"))
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
