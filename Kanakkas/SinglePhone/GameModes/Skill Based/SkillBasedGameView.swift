//
//  SkillBasedGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 16/03/2025.
//

import SwiftUI

struct SkillBasedGameView: View {
    @State private var availableCards: [SkillBasedCard] // Remaining cards
    @State private var usedCards: [SkillBasedCard] = [] // Keeps track of drawn cards in order
    @State private var currentIndex = -1 // Tracks position in `usedCards`
    let players: [String] // Player list
    
    // Special "Game Finished" card
    private let finishedCard = SkillBasedCard(
        title: "Spillet er Ferdig!",
        description: "Dere har spilt gjennom alle spillene 🎉\n Dette var et utvalg av noen drikkeleker! \n Finn gjene på deres egne!",
        category: "ingen tittel",
        needsPlayer: false
    )

    init(players: [String]) {
        self.players = players
        _availableCards = State(initialValue: skillBasedCards.shuffled())
    }

    var body: some View {
        ZStack {
            // Set background color dynamically
            (skillBasedCategoryColors[getCurrentCard()?.category ?? ""] ?? Color.red)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture { goToPreviousCard() }

                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture { goToNextCard() }
            }

            VStack {
                
                HStack {
                    QACBackButton()
                        .onTapGesture { goToPreviousCard() } // Back Button
                    Spacer()
                    SkillBasedTitleCard()
                    Spacer()
                    QACInfoButton { print("Info opened") }
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Display current challenge card
                VStack {
                    
                    Text(getCurrentCard()?.title ?? "Gjør dere klare!")
                        .font(Font.custom("LuckiestGuy-Regular", size: 32))
                        .bold()
                        .foregroundColor(.white)
                    
                    ScrollView {
                        Text(generateCardDescription(for: getCurrentCard()))
                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                           
                        
                    }
                }
                .padding()
                .cornerRadius(15)
                .shadow(radius: 5)
                
               Spacer()
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
        .onTapGesture { goToNextCard() } // Go forward when tapped
    }
    
    // Generate challenge text, replacing {player} with a random name
    private func generateCardDescription(for card: SkillBasedCard?) -> String {
        guard let card = card else { return "Test ferdighete deres!" }
        if card.needsPlayer, let randomPlayer = players.randomElement() {
            return card.description.replacingOccurrences(of: "{player}", with: randomPlayer)
        } else {
            return card.description
        }
    }
    
    // ✅ Show a new random card or "Game Finished" if no cards left
    private func goToNextCard() {
        if currentIndex < usedCards.count - 1 {
            // Move forward in the existing history
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
    private func getCurrentCard() -> SkillBasedCard? {
        if currentIndex >= 0 && currentIndex < usedCards.count {
            return usedCards[currentIndex]
        }
        return nil
    }
}

// MARK: - Preview
struct SkillBasedGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SkillBasedGameView(players: ["Emma", "Oliver", "Noah", "Sofie"])
        }
    }
}
