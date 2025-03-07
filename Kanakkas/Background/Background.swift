//
//  HomeBackground.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct HomeBackground: View {

    var body: some View {
        ZStack {
            // 🎨 Cartoonish Poker Table Gradient
            Color(.myred)
                .ignoresSafeArea(edges: .all)

            PlayingCards()
                .position(x: 600, y: 60)
                .rotationEffect(.degrees(180))
                        
            BeerMug()
                .position(x: 520, y: 320)
                .rotationEffect(.degrees(75))
            
            
            PlayingCards()
                .position(x: 150, y: 100)

            BeerMug()
                .position(x: 800, y: 220)
                .rotationEffect(.degrees(-160))
            
            
            BeerMug()
                .position(x: 800, y:300)
                .rotationEffect(.degrees(-210))
            
            PlayingCards()
                .position(x: 400, y: -150)
                .rotationEffect(.degrees(-90))
            
            
            BeerMug()
                .position(x: 150, y:200)
                .rotationEffect(.degrees(-210))
            
            PlayingCards()
                .position(x: 550, y: 100)
            
            
            BeerMug()
                .position(x: 200, y: 120)
                .rotationEffect(.degrees(-160))
            
            PlayingCards()
                .position(x: 100, y: 250)
                .rotationEffect(.degrees(-150))
            
            
            BeerMug()
                .position(x: 770, y: 320)
                .rotationEffect(.degrees(-10))
            
            PlayingCards()
                .position(x: 300, y: -130)
                .rotationEffect(.degrees(100))
            
            
            BeerMug()
                .position(x: 390, y:340)
                .rotationEffect(.degrees(-210))
            
            PlayingCards()
                .position(x: 280, y: 120)
        }
    }
}

// MARK: Table Edge
struct TableEdge: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 70)
            .stroke(
                Color(hue: 0.085, saturation: 0.688, brightness: 0.249), lineWidth: 30
            )
            .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 5)
            .ignoresSafeArea()
    }
}

struct HomeScreenBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
