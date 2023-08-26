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
    
    var font: Font?
    var widthFrame: Double
    var heightFrame: Double
    
    
    var body: some View {
        TextField("", text: $text, prompt: prompt)
            .frame(width: widthFrame, height: heightFrame)
            .keyboardType(keyboardType)
            .autocapitalization(.none)
            .font(font)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""), prompt: Text("text"), keyboardType: .emailAddress, font: .headline, widthFrame: 300, heightFrame: 300)
    }
}
