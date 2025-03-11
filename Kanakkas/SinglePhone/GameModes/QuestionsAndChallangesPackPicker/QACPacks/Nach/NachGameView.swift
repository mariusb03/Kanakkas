//
//  VorsetStarterGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//

import SwiftUI

struct NachGameView: View {
    @State private var currentIndex = 0
    let cards = nachCards
    let players: [String] // List of player names
    
    var body: some View {
        ZStack {
            // Set background color dynamically based on category
            (vorsetStarterCategoryColors[cards[currentIndex].category] ?? Color.black)
                .edgesIgnoringSafeArea(.all)

            // Detect screen taps (Left → Back, Right → Next)
            HStack {
                // Left side tap - Go back
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture { goToPreviousCard() }

                // Right side tap - Go forward
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture { goToNextCard() }
            }
            
            VStack {
                HStack {
                    QACBackButton() // Navigate back
                    
                    Spacer()
                    
                    NachTitleCard()
                    
                    Spacer()
                    
                    QACInfoButton {
                        print("Info opened") // Placeholder for Info action
                    }
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Show current card
                VStack {
                    Text(cards[currentIndex].title)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text(generateCardDescription(for: cards[currentIndex]))
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding()
                
                Spacer()
            }
        }
        .overlay(
            TableEdge()
        )
        .navigationBarBackButtonHidden(true)
    }
    
    // Function to generate card description, replacing {player} with a random player
    private func generateCardDescription(for card: NachCard) -> String {
        // Check if the card needs a player and replace {player} with a random name
        if card.needsPlayer, let randomPlayer = players.randomElement() {
            return card.description.replacingOccurrences(of: "{player}", with: randomPlayer)
        } else {
            return card.description
        }
    }
    
    private func goToNextCard() {
        if currentIndex < cards.count - 1 {
            currentIndex += 1
        }
    }
    
    private func goToPreviousCard() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
}

// MARK: - Preview
struct NachGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NachGameView(players: ["Emma", "Oliver", "Noah", "Sofie"])
        }
    }
}
