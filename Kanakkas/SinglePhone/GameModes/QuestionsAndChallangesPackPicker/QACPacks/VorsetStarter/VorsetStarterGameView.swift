//
//  VorsetStarterGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//

import SwiftUI

struct VorsetStarterGameView: View {
    @State private var availableCards: [VorsetStarterCard] = []
    @State private var usedCards: [VorsetStarterCard] = []
    @State private var currentIndex = -1
    let players: [String]
    @State private var showInfo = false

    private let finishedCard = VorsetStarterCard(
        title: "Spillet er Ferdig!",
        description: "Dere har gått gjennom alle kortene! 🎉\nStart på nytt eller prøv et annet spill!",
        category: "ingen tittel",
        needsPlayer: false
    )

    init(players: [String]) {
        self.players = players
    }

    var body: some View {
        ZStack {
            (vorsetStarterCategoryColors[getCurrentCard()?.category ?? ""] ?? Color.red)
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
                    Spacer()
                    VorsetStarterTitleCard()
                    Spacer()
                    QACInfoButton { showInfo = true }
                }
                .padding(.top, 20)

                Spacer()

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
                VorsetStarterInfoView {
                    showInfo = false // Dismiss overlay
                }
                .transition(.opacity) // Smooth fade-in effect
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
        .onAppear {
            availableCards = generateShuffledCards() // ✅ Initialize the deck when the view appears
        }
    }

    // ✅ Generate challenge text, replacing {player} with a random name
    private func generateCardDescription(for card: VorsetStarterCard?) -> String {
        guard let card = card else { return "Vorset starter!" }
        if card.needsPlayer, let randomPlayer = players.randomElement() {
            return card.description.replacingOccurrences(of: "{player}", with: randomPlayer)
        } else {
            return card.description
        }
    }

    // ✅ Show a new random card or "Game Finished" if no cards left
    private func goToNextCard() {
        if currentIndex < usedCards.count - 1 {
            currentIndex += 1
        } else if !availableCards.isEmpty {
            let newCard = availableCards.removeFirst()
            usedCards.append(newCard)
            currentIndex += 1
        } else {
            usedCards.append(finishedCard)
            currentIndex += 1
        }
    }

    // MARK: - Shuffle Cards with Rule Pairing
    func generateShuffledCards() -> [VorsetStarterCard] {
        var deck: [VorsetStarterCard] = vorsetStarterCards.filter { $0.category != "regel" && $0.category != "regel opphevet" }
        deck.shuffle()

        // ✅ Insert rule pairs dynamically
        for (rule, ruleBreak) in vorsetStarterPairedRules {
            let insertIndex = Int.random(in: 0..<deck.count)
            deck.insert(rule, at: insertIndex) // Insert rule somewhere in deck
            
            let removalIndex = min(insertIndex + Int.random(in: 5...7), deck.count) // Place rule-break 3-6 cards later
            deck.insert(ruleBreak, at: removalIndex)
        }

        return deck
    }

    private func goToPreviousCard() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }

    private func getCurrentCard() -> VorsetStarterCard? {
        if currentIndex >= 0 && currentIndex < usedCards.count {
            return usedCards[currentIndex]
        }
        return nil
    }
}

// MARK: - Preview
struct VorsetStarterGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VorsetStarterGameView(players: ["Emma", "Oliver", "Noah", "Sofie"])
        }
    }
}
