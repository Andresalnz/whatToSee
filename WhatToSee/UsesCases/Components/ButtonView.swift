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
    var width: CGFloat
    var height: CGFloat
    
    var action: () -> Void
    
    
    var body: some View {
        Button(title) {
           action()
        }
        .frame(width: width,height: height)
        .font(font)
        .foregroundColor(foregroundColor)
        .background(backgroundColor)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Inicia", font: .title2, foregroundColor: .black, backgroundColor: .green, width: 300, height: 50,  action: { print("boton") })
    }
}
