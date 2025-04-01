//
//  HundreSpørsmålGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//

import SwiftUI

struct HundreSpørsmålGameView: View {
    @State private var availableCards: [HundreSpørsmålCard] = hundreSpørsmålCards // ✅ Predefined order, no shuffle
    @State private var currentIndex = -1 // Index in `availableCards`
    let players: [String]
    @State private var showInfo = false

    private let finishedCard = HundreSpørsmålCard(
        title: "Spillet er Ferdig!",
        description: "Dere har gått gjennom alle 100 spørsmålene! 🎉\nStart på nytt eller prøv et annet spill!",
        category: "ingen tittel",
        needsPlayer: false
    )

    init(players: [String]) {
        self.players = players
    }

    var body: some View {
        ZStack {
            (hundreSpørsmålCategoryColors[getCurrentCard()?.category ?? ""] ?? Color.red)
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
                    HundreSpørsmålTitleCard()
                    Spacer()
                    QACInfoButton {
                        showInfo = true }
                }
                .padding(.top, 20)

                Spacer()

                VStack {
                    Text(getCurrentCard()?.title ?? "Finn frem snusboksen!")
                        .font(Font.custom("LuckiestGuy-Regular", size: 32))
                        .foregroundColor(.white)

                    Text(generateCardDescription(for: getCurrentCard()))
                        .font(Font.custom("LuckiestGuy-Regular", size: 30))
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
                HundreSpørsmålInfoView {
                    showInfo = false // Dismiss overlay
                }
                .transition(.opacity) // Smooth fade-in effect
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
    }

    // ✅ Generate challenge text, replacing {player} with a random name
    private func generateCardDescription(for card: HundreSpørsmålCard?) -> String {
        guard let card = card else { return "100 spørsmål serveres nå!" }
        if card.needsPlayer, let randomPlayer = players.randomElement() {
            return card.description.replacingOccurrences(of: "{player}", with: randomPlayer)
        } else {
            return card.description
        }
    }

    // ✅ Move forward through the list of 100 questions
    private func goToNextCard() {
        if currentIndex < availableCards.count - 1 {
            currentIndex += 1
        } else {
            currentIndex += 1
        }
    }

    // ✅ Move backward through the list
    private func goToPreviousCard() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }

    // ✅ Get the current card based on `currentIndex`
    private func getCurrentCard() -> HundreSpørsmålCard? {
        if currentIndex >= 0 && currentIndex < availableCards.count {
            return availableCards[currentIndex]
        } else if currentIndex >= availableCards.count {
            return finishedCard // Show the "Game Finished" card after the 100th question
        }
        return nil
    }
}

// MARK: - Preview
struct HundreSpørsmålGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HundreSpørsmålGameView(players: ["Emma", "Oliver", "Noah", "Sofie"])
        }
    }
}
