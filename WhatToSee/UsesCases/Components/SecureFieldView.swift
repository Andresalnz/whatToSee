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
    var padding: CGFloat
    var paddingHorizontal: CGFloat
    var opacity: Double?
    var cornerRadius: CGFloat?
    var font: Font?
    
    
    var body: some View {
        SecureField(text: $text , prompt: prompt) {
            
        }
        .frame(width: 300, height: 40)
        .keyboardType(keyboardType)
        .font(font)
        .background(Color.gray.opacity(opacity ?? 0))
        .cornerRadius(cornerRadius ?? 0)        
    }
}

struct SecureFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldView(text: .constant(""), keyboardType: .default, padding: 8, paddingHorizontal: 60)
    }
}
