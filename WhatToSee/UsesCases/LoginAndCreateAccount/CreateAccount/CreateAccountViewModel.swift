//
//  CreateAccountViewModel.swift
//  WhatToSee
//
//  Created by Andres Aleu on 18/8/23.
//

import Foundation
import FirebaseAuth

final class CreateAccountViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var registered: Bool = false
    @Published var alert: Bool = false
    @Published var errorAlert: String = ""
    
    
     func createAccountAction() {
         Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error  in
             guard let wSelf = self else { return }
             if let error = error as? NSError {
                 print(error)
                 wSelf.registered = false
                 wSelf.alert = true
                 wSelf.errorCreateAccount(error)
             } else {
                 print("HECHO")
                 wSelf.registered = true
                 wSelf.alert = false
             }
         }
    }
    
    func errorCreateAccount(_ err: NSError) {
        switch err.code {
            case AuthErrorCode.invalidEmail.rawValue:
                errorAlert = "Email con el formato incorrecto"
                email = ""
            case AuthErrorCode.emailAlreadyInUse.rawValue:
                errorAlert = "El email introducido ya esta en uso"
                email = ""
            case AuthErrorCode.weakPassword.rawValue:
                errorAlert = "Contraseña poco segura. Debe tener seis caracteres o mas"
                password = ""
            case AuthErrorCode.userDisabled.rawValue:
                errorAlert = "tu cuenta esta inhabilitada, pongase en contacto con nosotros"
                cancelAction()
            default:
                print("default")

        }
    }
    
    func cancelAction() {
        username = ""
        email = ""
        password = ""
    }
}
