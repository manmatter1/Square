//
//  Menu.swift
//  Square
//
//  Created by Arryn Lyness on 23/04/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 50)
                .padding(.top, 50)
                .background(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
                .foregroundColor(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
            
                .cornerRadius(20)
            
            Text("Truth OR Dare")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
                
                
            
        
        }
        
        
        
        
        
        VStack {
                    Spacer()
                    Rectangle()
                        .frame(height: 50)
                        .padding(.bottom, 50)
                        .background(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
                        .foregroundColor(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
                        .cornerRadius(20)
                }
        
    }
}


struct Menu: View {
    var body: some View {
        VStack(spacing: 0) {
            MenuView()
                .ignoresSafeArea()

            
        }
    }
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
