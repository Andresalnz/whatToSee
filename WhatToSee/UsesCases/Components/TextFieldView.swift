//
//  TextFieldView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 19/8/23.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    var prompt: Text?
    var keyboardType: UIKeyboardType
    var opacity: Double?
    var cornerRadius: CGFloat?
    
    var body: some View {
        TextField("", text: $text, prompt: prompt)
            .frame(width: 300, height: 40)
            .keyboardType(keyboardType)
            .autocapitalization(.none)
            .font(.headline)
            .background(Color.gray.opacity(opacity ?? 0))
            .cornerRadius(cornerRadius ?? 0)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""), prompt: Text("text"), keyboardType: .emailAddress, opacity: 0.3, cornerRadius: 8)
    }
}
