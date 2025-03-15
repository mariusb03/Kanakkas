//
//  OverUnderGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 12/03/2025.
//

import SwiftUI

struct OverUnderGameView: View {
    @StateObject private var deck = InfiniteDeck()
    @State private var topCard: Card
    @State private var previousCard: Card? = nil // Stores the previous card
    @State private var showInfo = false // State to show the info overlay

    init() {
        let initialCard = InfiniteDeck().drawCard() // Start with one drawn card
        _topCard = State(initialValue: initialCard)
    }

    var body: some View {
        ZStack {
            // 🏡 Home background
            HomeBackground()
            
            VStack {
                HStack {
                    VStack {
                        CustomBackButton()
                            .padding(.top, 20)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    // 📌 Previous Card Display
                    VStack {
                        ZStack {
                            Text("Forrige kort!")
                                .foregroundStyle(.red)
                                .font(Font.custom("LuckiestGuy-Regular", size: 22))
                                .frame(width: 100, height: 50)
                                .multilineTextAlignment(.center)
                                .offset(x: -30)
                                .shadow(color: .red, radius: 5)
                            
                            Text("Forrige kort!")
                                .foregroundStyle(.white)
                                .font(Font.custom("LuckiestGuy-Regular", size: 20))
                                .frame(width: 100, height: 50)
                                .multilineTextAlignment(.center)
                                .offset(x: -30)
                                .shadow(color: .red, radius: 5)
                        }
                        
                        if let prevCard = previousCard {
                            CardView(card: prevCard)
                                .scaleEffect(0.6) // Scales the entire card down
                                .opacity(0.8)
                                .offset(x: -30) // Adjust position
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.5))
                                .frame(width: 110, height: 180)
                                .overlay(
                                    Text("❓")
                                        .font(Font.custom("LuckiestGuy-Regular", size: 34))
                                        .foregroundColor(.gray)
                                )
                                .offset(x: -30)
                        }
                    }

                    // 🎴 Main Game View (Current Deck)
                    CardGameView(updatePreviousCard: { newPrevCard in
                        previousCard = newPrevCard // Updates the previous card when a new one is drawn
                    })
                    .shadow(radius: 5)
                    
                    Spacer()
                    
                    VStack {
                        OverUnderInfoButton {
                            showInfo = true // Open the overlay when tapped
                        }
                        .padding(.top, 20)
                        Spacer()
                    }
                }
            }
            
            // 🔹 OverUnderInfoView Overlay
            if showInfo {
                OverUnderInfoView {
                    showInfo = false // Dismiss overlay
                }
                .transition(.opacity) // Smooth fade-in effect
            }
        }
        .overlay (
            TableEdge()
        )
        .animation(.easeInOut(duration: 0.3), value: showInfo) // Animate overlay appearance
    }
}

// MARK: - Preview
struct OverUnderGameView_Previews: PreviewProvider {
    static var previews: some View {
        OverUnderGameView()
    }
}
