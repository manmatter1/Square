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
            
            ZStack {
                Text("Truth Or Dare")
                    .font(.custom("FredokaOne-Regular", size: 36))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                
                
            }
            
            
            
        }
        
        
        
        VStack(spacing: 25) {
            
            Spacer()
            
            
            Rectangle()
                .frame(width: 300, height: 25)
                .padding(.top, 50)
                .background(Color.green)
                .foregroundColor(Color.green)
                .cornerRadius(20)
            
            Rectangle()
                .frame(width: 300, height: 25)
                .padding(.top, 50)
                .background(Color(#colorLiteral(red: 0.6901960784, green: 0.8235294118, blue: 0.9254901961, alpha: 1))
)
                .foregroundColor(Color(#colorLiteral(red: 0.6901960784, green: 0.8235294118, blue: 0.9254901961, alpha: 1))
)
                .cornerRadius(20)
            
            Rectangle()
                .frame(width: 300, height: 25)
                .padding(.top, 50)
                .background(Color.teal)
                .foregroundColor(Color.teal)
                .cornerRadius(20)
            
            Rectangle()
                .frame(width: 300, height: 25)
                .padding(.top, 50)
                .background(Color.cyan)
                .foregroundColor(Color.cyan)
                .cornerRadius(20)
            
            Rectangle()
                .frame(width: 300, height: 25)
                .padding(.top, 50)
                .background(Color.blue)
                .foregroundColor(Color.blue)
                .cornerRadius(20)
            
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
