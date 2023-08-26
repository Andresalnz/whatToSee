//
//  ButtonView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 19/8/23.
//

import SwiftUI

struct ButtonView: View {
    
    var title: String
    var font: Font
    var foregroundColor: Color
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var width: CGFloat?
    var height: CGFloat?
    
    var action: () -> Void
    
    
    var body: some View {
        Button(title) {
           action()
        }
        .frame(width: width,height: height)
        .font(font)
        .foregroundColor(foregroundColor)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Inicia", font: .title2, foregroundColor: .black, backgroundColor: .green, cornerRadius: 10, width: 300, height: 50,  action: { print("boton") })
    }
}
