//
//  VorsetStarterGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//

import SwiftUI

struct NachGameView: View {
    @State private var availableCards: [NachCard] // Remaining cards to draw
    @State private var usedCards: [NachCard] = [] // Cards shown so far
    @State private var currentIndex = -1 // Index in usedCards
    let players: [String] // Player list
    
    // Special "Game Finished" card
    private let finishedCard = NachCard(
        title: "Spillet er Ferdig!",
        description: "Dere har gått gjennom alle kortene! 🎉\nStart på nytt eller prøv et annet spill!",
        category: "ingen tittel",
        needsPlayer: false
    )

    init(players: [String]) {
        self.players = players
        _availableCards = State(initialValue: nachCards.shuffled()) // Randomize cards
    }

    var body: some View {
        ZStack {
            // Background color dynamically based on current card category
            (vorsetStarterCategoryColors[getCurrentCard()?.category ?? ""] ?? Color.red)
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
                    QACBackButton() // Back button
                    Spacer()
                    NachTitleCard()
                    Spacer()
                    QACInfoButton { print("Info opened") }
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Show current challenge card
                VStack {
                    Text(getCurrentCard()?.title ?? "Gjør dere klare!")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text(generateCardDescription(for: getCurrentCard()))
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding()
                .cornerRadius(15)
                .shadow(radius: 5)
                
                Spacer()
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
    }
    
    // ✅ Generate challenge text, replacing {player} with a random name
    private func generateCardDescription(for card: NachCard?) -> String {
        guard let card = card else { return "Nachet blir intenst!" }
        if card.needsPlayer, let randomPlayer = players.randomElement() {
            return card.description.replacingOccurrences(of: "{player}", with: randomPlayer)
        } else {
            return card.description
        }
    }
    
    // ✅ Show a new random card or "Game Finished" if no cards left
    private func goToNextCard() {
        if currentIndex < usedCards.count - 1 {
            // Move forward in history
            currentIndex += 1
        } else if !availableCards.isEmpty {
            // Draw a new random card
            let newCard = availableCards.removeFirst()
            usedCards.append(newCard)
            currentIndex += 1
        } else {
            // Show the "Game Finished" card if all cards are used
            usedCards.append(finishedCard)
            currentIndex += 1
        }
    }
    
    // ✅ Go back to the previous card
    private func goToPreviousCard() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }

    // ✅ Get the current card based on `currentIndex`
    private func getCurrentCard() -> NachCard? {
        if currentIndex >= 0 && currentIndex < usedCards.count {
            return usedCards[currentIndex]
        }
        return nil
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
