//
//  SeparatorWithOrView.swift
//  WhatToSee
//
//  Created by Andres Aleu on 19/8/23.
//

import SwiftUI

struct SeparatorWithOrView: View {
    
    var height: CGFloat?
    var backgroundColor: Color?
    var padding: CGFloat?
    var text: Text?
    
    var body: some View {
        VStack {
            Divider()
                .frame(height: height)
                .background(backgroundColor)
        }
        .padding(padding ?? 0)
        text
            .font(.callout)
            .foregroundColor(.black)
        VStack {
                Divider()
                    .frame(height: height)
                    .background(backgroundColor)
                
            }
            .padding(padding ?? 0)
    }
}

struct SeparatorWithOrView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorWithOrView()
    }
}
