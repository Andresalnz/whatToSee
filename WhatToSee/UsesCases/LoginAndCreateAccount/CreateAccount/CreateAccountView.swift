//
//  CreateAccountView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 17/8/23.
//

import SwiftUI

struct CreateAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CreateAccountViewModel 
    
    var body: some View {
        VStack(alignment: .center) {
            Text("¡Empecemos!")
                .font(.title)
                .bold()
                .padding()
            
            TextFieldView(text: $viewModel.username, prompt: Text("Nombre"), keyboardType: .default, font: .headline, widthFrame: 300, heightFrame: 40)
                .textFieldStyle(.roundedBorder)
                
            TextFieldView(text: $viewModel.email, prompt: Text("Correo"), keyboardType: .emailAddress, font: .headline, widthFrame: 300, heightFrame: 40)
                .textFieldStyle(.roundedBorder)
            
            SecureFieldView(text: $viewModel.password, prompt: Text("Contraseña"), keyboardType: .default, font: .headline, widthFrame: 300, heightFrame: 40)
                .textFieldStyle(.roundedBorder)

            HStack(alignment: .center) {
                
                ButtonView(title: "Crear Cuenta", font: .title2, foregroundColor: .white, backgroundColor: .green, width: 150, height: 50) {
                    viewModel.createAccountAction()
                }
                .cornerRadius(8)

                ButtonView(title: "Cancelar", font: .title2, foregroundColor: .white, backgroundColor: .gray, width: 150, height: 50) {
                    //
                }
                .cornerRadius(8)
            }
            
        }
        .padding(.bottom, 100)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(viewModel: CreateAccountViewModel())
    }
}
