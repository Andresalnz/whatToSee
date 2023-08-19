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
    
     func createAccountAction() {
         Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error  in
             guard let wSelf = self else { return }
             if let error = error {
                 print(error.localizedDescription)
                 wSelf.registered = false
                 print("Error al crear la cuenta")
             } else {
                 print("HECHO")
                 wSelf.registered = true
             }
         }
    }
    
    
    
}
