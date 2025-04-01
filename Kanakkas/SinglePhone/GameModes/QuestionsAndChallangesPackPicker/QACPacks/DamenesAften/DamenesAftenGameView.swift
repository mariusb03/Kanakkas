//
//  DamenesAftenGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//

import SwiftUI

struct DamenesAftenGameView: View {
    @State private var availableCards: [DamenesAftenCard] // Remaining cards to draw
    @State private var usedCards: [DamenesAftenCard] = [] // Cards shown so far
    @State private var currentIndex = -1 // Index in usedCards
    let players: [String] // List of player names
    @State private var showInfo = false

    // Special "Game Finished" card
    private let finishedCard = DamenesAftenCard(
        title: "Spillet er Ferdig!",
        description: "Dere har gått gjennom alle kortene! 🎉\nStart på nytt eller prøv et annet spill!",
        category: "ingen tittel",
        needsPlayer: false
    )

    init(players: [String]) {
        self.players = players
        _availableCards = State(initialValue: damenesAftenCards.shuffled()) // Shuffle cards
    }

    var body: some View {
        ZStack {
            // ✅ Set default red background before first card is drawn
            (damenesAftenCategoryColors[getCurrentCard()?.category ?? ""] ?? Color.red)
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
                    DamenesAftenTitleCard()
                    Spacer()
                    QACInfoButton { showInfo = true }
                }
                .padding(.top, 20)

                Spacer()

                // ✅ Show current challenge card
                VStack {
                    Text(getCurrentCard()?.title ?? "Gjør dere klare!")
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
                DamenesAftenInfoView {
                    showInfo = false // Dismiss overlay
                }
                .transition(.opacity) // Smooth fade-in effect
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
    }

    // ✅ Generate challenge text, replacing {player} with a random name
    private func generateCardDescription(for card: DamenesAftenCard?) -> String {
        guard let card = card else { return "Vinkvelden skal kjøres opp og jentene skal snakke gutter og drama!" }
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
    private func getCurrentCard() -> DamenesAftenCard? {
        if currentIndex >= 0 && currentIndex < usedCards.count {
            return usedCards[currentIndex]
        }
        return nil
    }
}

// MARK: - Preview
struct DamenesAftenGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DamenesAftenGameView(players: ["Emma", "Oliver", "Noah", "Sofie"])
        }
    }
}
