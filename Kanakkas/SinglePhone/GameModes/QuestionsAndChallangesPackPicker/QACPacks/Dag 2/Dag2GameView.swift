//
//  Dag2GameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//

import SwiftUI

struct Dag2GameView: View {
    @State private var availableCards: [Dag2Card] // Remaining cards to draw
    @State private var usedCards: [Dag2Card] = [] // Cards shown so far
    @State private var currentIndex = -1 // Index in usedCards
    let players: [String] // List of player names
    @State private var showInfo = false

    // Special "Game Finished" card
    private let finishedCard = Dag2Card(
        title: "Spillet er Ferdig!",
        description: "Dere har gått gjennom alle kortene! 🎉\nStart på nytt eller prøv et annet spill!",
        category: "ingen tittel",
        needsPlayer: false
    )

    init(players: [String]) {
        self.players = players
        _availableCards = State(initialValue: dag2Cards.shuffled()) // Shuffle cards
    }

    var body: some View {
        ZStack {
            // ✅ Set default red background before first card is drawn
            (dag2CategoryColors[getCurrentCard()?.category ?? ""] ?? Color.red)
                .edgesIgnoringSafeArea(.all)

            // ✅ Enable Left (Back) & Right (Next) Tap
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
                    QACBackButton() // Back button
                    Spacer()
                    Dag2TitleCard()
                    Spacer()
                    QACInfoButton {
                        showInfo = true
                    }
                }
                .padding(.top, 20)

                Spacer()

                // ✅ Show current challenge card
                VStack {
                    Text(getCurrentCard()?.title ?? "Pakken er ikke klar enda!")
                        .font(Font.custom("LuckiestGuy-Regular", size: 32))
                        .foregroundColor(.white)

                    Text(generateCardDescription(for: getCurrentCard()))
                        .font(Font.custom("LuckiestGuy-Regular", size: 20))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding()
                .cornerRadius(15)
                .shadow(radius: 5)

                Spacer()
            }
            if showInfo {
                Dag2InfoView {
                    showInfo = false // Dismiss overlay
                }
                .transition(.opacity) // Smooth fade-in effect
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
    }

    // ✅ Generate challenge text, replacing {player} with a random name
    private func generateCardDescription(for card: Dag2Card?) -> String {
        guard let card = card else { return "Kommer snart!" }
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
    private func getCurrentCard() -> Dag2Card? {
        if currentIndex >= 0 && currentIndex < usedCards.count {
            return usedCards[currentIndex]
        }
        return nil
    }
}

// MARK: - Preview
struct Dag2GameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Dag2GameView(players: ["Emma", "Oliver", "Noah", "Sofie"])
        }
    }
}
