//
//  LoadingScreen.swift
//  06_faceID_Firebase
//
//  Created by emm on 04/01/2021.
//

import SwiftUI

struct LoadingScreen: View {
    @State var animate = false
    
    var body: some View {
        ZStack {
            
            Color.primary.opacity(0.3)
                .ignoresSafeArea(.all, edges: .all)
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(Color("green"), lineWidth: 10)
                .frame(width: 60, height: 60)
                .rotationEffect(.init(degrees: animate ? 360 : 0))
                .padding(40)
                .background(Color.primary)
                .cornerRadius(15)
        }
        .onAppear(perform: {
            withAnimation(Animation.linear.speed(0.6).repeatForever(autoreverses: false )){
                animate.toggle()
            }
        })
    }
}


