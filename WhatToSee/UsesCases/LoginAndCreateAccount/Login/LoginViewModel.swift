//
//  LoginViewModel.swift
//  WhatToSee
//
//  Created by Andres Aleu on 17/8/23.
//

import Foundation
import FirebaseAuth


final class LoginViewModel: ObservableObject {
    
  
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var logged: Bool = false
    @Published var alertError: Bool = false
    @Published var error: String = ""
    
    func loginAction() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error  in
            guard let wSelf = self else { return }
            if let error = error {
                let error = error as NSError
                wSelf.errorLogin(error)
                print("Error Login \(error)")
                wSelf.logged = false
                wSelf.alertError = true
            } else {
                print("HECHO")
                wSelf.logged = true
                wSelf.alertError = false
            }
        }
   }
    
    func errorLogin(_ err: NSError) {
        switch err.code {
            case AuthErrorCode.invalidEmail.rawValue, AuthErrorCode.wrongPassword.rawValue:
                print("EMIAL NO")
                error = "Email o contraseña incorrecto"
            case AuthErrorCode.userDisabled.rawValue:
                error = "tu cuenta esta inhabilitada, pongase en contacto con nosotros"
            case AuthErrorCode.userNotFound.rawValue:
                error = "Este usuario no se encuentra. Puede haber sido borrado"
            default:
                print("default")
            
        }
    }
    
  
    
    func cancelAction() {
        email = ""
        password = ""
    }
    
}
