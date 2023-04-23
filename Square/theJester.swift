//
//  theJester.swift
//  Square
//
//  Created by Jay Jayaprakash on 23/04/2023.
//

import SwiftUI

struct theJester: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Truth")
                    .font(.system(size:80))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Text("OR")
                    .font(.system(size: 80))
                    .fontWeight(.heavy)
                Text("Dare")
                    .font(.system(size:80))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
        }
        
    }
}

struct theJester_Previews: PreviewProvider {
    static var previews: some View {
        theJester()
    }
}
