//
//  Circle.swift
//  Square
//
//  Created by Arryn Lyness on 23/04/2023.
//

import SwiftUI

struct Circle: View {
    var body: some View {
        VStack {
            
            Text("Hello, Jay")
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            
            Image(systemName: "hand.tap")
                .padding()
            
        }
    }
}

struct Circle_Previews: PreviewProvider {
    static var previews: some View {
        Circle()
    }
}
