//
//  OverUnderGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 12/03/2025.
//


//
//  OverUnderGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 12/03/2025.
//

import SwiftUI

struct DeckOfCardsGameView: View {
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
                    
                    
                    VStack {
                        
                        CardGameView(updatePreviousCard: { _ in })
                            .shadow(radius: 5)
                        
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        DeckOfCardsInfoButton {
                            showInfo = true // Open the overlay when tapped
                            }
                            .padding(.top, 20)
                            Spacer()
                        }
                }
            }
            
            // 🔹 OverUnderInfoView Overlay
            if showInfo {
                DeckOfCardsInfoView {
                    showInfo = false // Dismiss overlay
                }
                .transition(.opacity) // Smooth fade-in effect
            }
        }
        .overlay (
            TableEdge()
        )
        .animation(.easeInOut(duration: 0.5), value: showInfo) // Animate overlay appearance
    }
}

// MARK: - Preview
struct DeckOfCardsGameView_Previews: PreviewProvider {
    static var previews: some View {
        DeckOfCardsGameView()
    }
}
