//
//  SecureFieldView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 19/8/23.
//

import SwiftUI

struct SecureFieldView: View {
    
    @Binding var text: String
    var prompt: Text?
    var keyboardType: UIKeyboardType
    var font: Font?
    var widthFrame: Double
    var heightFrame: Double
    
    var body: some View {
        SecureField(text: $text , prompt: prompt) {
            
        }
        .frame(width: widthFrame, height: heightFrame)
        .keyboardType(keyboardType)
        .font(font)
    }
}

struct SecureFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldView(text: .constant(""), prompt: Text("contraseña"), keyboardType: .default, font: .headline, widthFrame: 300, heightFrame: 8)
    }
}
