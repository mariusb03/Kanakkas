//
//  PlayingCards.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct PlayingCards: View {
    @State private var isTapped = false
    
    var body: some View {
        ZStack {
            // 🃏 Bottom Card
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white.opacity(1))
                .frame(width: 50, height: 70)
                .offset(x: 7, y: 7)
                .rotationEffect(.degrees(-20))
                .shadow(radius: 5)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gold, lineWidth: 2)
                .frame(width: 40, height: 60)
                .offset(x: 7, y: 7)
                .rotationEffect(.degrees(-20))
                .shadow(radius: 5)
            
            // 🃏 Top Card
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white.opacity(1))
                .frame(width: 50, height: 70)
                .rotationEffect(.degrees(5))
                .shadow(radius: 5)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gold, lineWidth: 2)
                .frame(width: 40, height: 60)
                .rotationEffect(.degrees(5))
                .shadow(radius: 5)
            
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white.opacity(1))
                .frame(width: 50, height: 70)
                .offset(x: -7, y: -2)
                .rotationEffect(.degrees(25))
                .shadow(radius: 5)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gold, lineWidth: 2)
                .frame(width: 40, height: 60)
                .offset(x: -7, y: -2)
                .rotationEffect(.degrees(25))
                .shadow(radius: 5)
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

struct Playingcards: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
