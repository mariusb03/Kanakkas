//
//  BeerMug.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct BeerMug: View {
    @State private var isTapped = false
    
    var body: some View {
        ZStack {
            // 🍺 Beer Liquid
            Circle()
                .stroke(Color.white.opacity(0.9), lineWidth: 5)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.9), Color.orange.opacity(0.8)]),
                                     startPoint: .top,
                                     endPoint: .bottom))
                .frame(width: 50, height: 50)
                .shadow(radius : 5)
            
            
            // 🍺 Mug Handle
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.9))
                .frame(width: 24, height: 12)
                .offset(x: 32, y: 0)
                .shadow(radius : 5)
            
            
            // 🍺 Foam (Bubbles)
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 20, height: 20)
                .offset(x: -13, y: -16)
            
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 25, height: 25)
                .offset(x: 0, y: -20)
            
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 15, height: 15)
                .offset(x: 15, y: -17)
            
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 25, height: 25)
                .offset(x: 15, y: -5)
            
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 15, height: 15)
                .offset(x: 0, y: -6)
            
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 15, height: 15)
                .offset(x: 16, y: 7)
        }
        .scaleEffect(isTapped ? 1.2 : 1.0) // Bounce effect
        .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0), value: isTapped)
        .onTapGesture {
            isTapped.toggle()
            
            // Reset animation after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isTapped = false
            }
        }
    }
}


struct Beermug: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
