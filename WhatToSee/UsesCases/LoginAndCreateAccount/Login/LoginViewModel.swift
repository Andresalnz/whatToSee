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
    
    func loginAction() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error  in
            guard let wSelf = self else { return }
            if let error = error {
                print(error.localizedDescription)
                wSelf.logged = false
                print("Error al HACER LOGIN")
            } else {
                print("HECHO")
                wSelf.logged = true
            }
        }
   }
    
}
