//
//  Menu.swift
//  Square
//
//  Created by Arryn Lyness on 23/04/2023.
//

import SwiftUI

struct MenuViewNew: View {
    var body: some View {
        VStack{
            ZStack {
                Rectangle()
                    .frame(height: 50)
                    .padding(.top, 50)
                    .background(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
                    .foregroundColor(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
                    .cornerRadius(20)
                    .glowmenu(color: .orange)
                
                ZStack {
                    Text("Truth Or Dare")
                        .font(.custom("FredokaOne-Regular", size: 36))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                    
                   
                }
            }
            
        }
        
    }
    
}

struct MenuView: View {
    var body: some View {
        ZStack {
            BackgroundGradientMenu(value: Int.random(in: 1...5))
                .ignoresSafeArea()
            VStack{
                
                
                ZStack {
                    Rectangle()
                        .frame(height: 50)
                        .padding(.top, 50)
                        .background(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
                        .foregroundColor(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
                        .cornerRadius(20)
                    
                    ZStack {
                        Text("Truth Or Dare")
                            .foregroundColor(Color.white)
                            .font(.system(size:48))
                            .fontWeight(.heavy)
                            .offset(x:0,y:20)
                    }
                }
                
                Spacer()
            
                
                
                VStack(spacing: 40){
                    NavigationLink(destination: ThePrompt(categoryCaught:"Kids")) {
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity, height: 75)
                                .foregroundColor(Color.green)
                                .cornerRadius(20)
                                .padding(.horizontal,60)
                                .glowmenu(color: .green)
                            
                            Text("Kids")
                                .foregroundColor(Color.white)
                                .font(.system(size:48))
                                .fontWeight(.heavy)
                        }
                    }
                    
                    NavigationLink(destination: ThePrompt(categoryCaught:"Teens")) {
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity, height: 75)
                                .foregroundColor(Color(#colorLiteral(red: 0.6901960784, green: 0.8235294118, blue: 0.9254901961, alpha: 1)))
                                .cornerRadius(20)
                                .padding(.horizontal,60)
                                .glowmenu(color: Color(#colorLiteral(red: 0.6901960784, green: 0.8235294118, blue: 0.9254901961, alpha: 1)))
                            
                            Text("Teens")
                                .foregroundColor(Color.white)
                                .font(.system(size:48))
                                .fontWeight(.heavy)
                        }
                    }
                    
                    NavigationLink(destination: ThePrompt(categoryCaught:"Adults")) {
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity, height: 75)
                                .foregroundColor(Color.teal)
                                .cornerRadius(20)
                                .padding(.horizontal,60)
                                .glowmenu(color: .teal)
                            
                            Text("Adults")
                                .foregroundColor(Color.white)
                                .font(.system(size:48))
                                .fontWeight(.heavy)
                        }
                    }
                    
                    NavigationLink(destination: ThePrompt(categoryCaught:"Extreme")) {
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity, height: 75)
                                .foregroundColor(Color.red)
                                .cornerRadius(20)
                                .padding(.horizontal,60)
                                .glowmenu(color: .red)
                            
                            Text("Extreme")
                                .foregroundColor(Color.white)
                                .font(.system(size:48))
                                .fontWeight(.heavy)
                        }
                    }
                    
                    NavigationLink(destination: ThePrompt(categoryCaught:"Everything")) {
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity, height: 75)
                                .foregroundColor(Color.blue)
                                .cornerRadius(20)
                                .padding(.horizontal,60)
                                .glowmenu(color: .blue)
                            
                            
                            Text("Everything")
                                .foregroundColor(Color.white)
                                .font(.system(size:48))
                                .fontWeight(.heavy)
                        }
                        
                    }
                }
                Spacer()
                VStack {
                    
                    
                    ZStack {
                        Spacer()
                        Rectangle()
                            .frame(height: 50)
                            .padding(.bottom, 50)
                            .background(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
                            .foregroundColor(Color(#colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.2352941176, alpha: 1)))
                            .cornerRadius(20)
                            .glowmenu(color: .orange)
                        
                        Text("AD")
                            .foregroundColor(Color.white)
                            .font(.system(size:48))
                            .fontWeight(.heavy)
                            
                            
                        
                    }
                    
                }
            }.ignoresSafeArea()
        }
        
        
        
       
    }
}







struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct BackgroundGradientMenu: View {
    var value:Int
    @Environment(\.colorScheme) var colorScheme
    @State private var gradientStart = UnitPoint(x: 0, y: 0)
    @State private var gradientEnd = UnitPoint(x: 1, y: 1)
    
    private var gradient: Gradient {
        switch value {
        case 1:
            return Gradient(colors: [.orange, colorScheme == .dark ? .red : .pink])
        case 2:
            return Gradient(colors: [.green, .blue])
        case 3:
            return Gradient(colors: [.pink, .blue])
        case 4:
            return Gradient(colors: [.red, .pink])
        case 0:
            return Gradient(colors: [Color("RedVelvet"), Color("Gold")])
        default:
            return Gradient(colors: [.orange, colorScheme == .dark ? .red : .pink])
        }
    }

    
    var body: some View {
    
        Rectangle()
            .fill(LinearGradient(gradient: gradient, startPoint: gradientStart, endPoint: gradientEnd))
            .frame(width: .infinity, height: .infinity)
            .cornerRadius(15)
            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: true))
            .onAppear {
                gradientStart = UnitPoint(x: 1, y: 0)
                gradientEnd = UnitPoint(x: 0, y: 1)
            }
    }
}

struct GlowMenu: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        ZStack{
            content
                .blur(radius: 5)
                .shadow(color: color, radius: 5)
            content
        }
    }
}

extension View{
    func glowmenu(color: Color = .white) -> some View{
        modifier(GlowMenu(color: color))
    }
}

