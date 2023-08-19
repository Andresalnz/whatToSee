//
//  ButtonView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 19/8/23.
//

import SwiftUI

struct ButtonView: View {
    
    var title: String
    var padding: CGFloat
    var paddingTop: CGFloat
    var paddingBottom: CGFloat
    var font: Font
    var foregroundColor: Color
    var backgroundColor: Color
    var cornerRadius: CGFloat?
    
    var action: () -> Void
    
    
    var body: some View {
        
       
        Button(title) {
           action()
        }
        .padding(padding)
        .font(.title2)
        .foregroundColor(.white)
        .background(.green)
        .cornerRadius(8)
        .padding(.top,15)
        .padding(.bottom,15)
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Inicia", padding: 8, paddingTop: 15, paddingBottom: 15, font: .title2, foregroundColor: .black, backgroundColor: .green, action: { print("boton") })
    }
}
