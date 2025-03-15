//
//  KrigGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 15/03/2025.
//

import SwiftUI

enum GameState {
    case cardsFaceDown
    case cardsRevealed
    case preparingNextRound
}

struct KrigGameView: View {
    let players: [String]
    @State private var player1: String
    @State private var player2: String
    @StateObject private var deck = InfiniteDeck()
    @State private var player1Card: Card?
    @State private var player2Card: Card?
    @State private var showInfo = false
    @State private var isWar = false
    @State private var sipMultiplier = 1
    @State private var lastNewPlayer: String? = nil
    @State private var gameState: GameState = .cardsFaceDown
    @State private var pendingWinner: String? = nil
    @State private var resultMessage: String = ""
    @State private var showPopup = false // Controls the pop-up visibility

    init(players: [String]) {
        self.players = players
        var randomPair = players.shuffled().prefix(2)
        _player1 = State(initialValue: randomPair.first ?? "Player 1")
        _player2 = State(initialValue: randomPair.last ?? "Player 2")
    }

    var body: some View {
        ZStack {
            HomeBackground()

            VStack {
                Spacer()
                HStack {
                    CustomBackButton()
                    Spacer()
                    ZStack {
                        Text("Krig")
                            .font(Font.custom("LuckiestGuy-Regular", size: 53))
                            .foregroundColor(.red)
                            .bold()
                            .shadow(color: .red, radius: 5)
                        
                        Text("Krig")
                            .font(Font.custom("LuckiestGuy-Regular", size: 50))
                            .foregroundColor(.white)
                            .bold()
                            .shadow(color: .red, radius: 5)
                    }
                    .padding(.top)
                    Spacer()
                    KrigInfoButton {
                        showInfo = true
                    }
                }

                HStack {
                    Text(player1)
                        .font(Font.custom("LuckiestGuy-Regular", size: 30))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                    Spacer()
                    Text("VS")
                        .font(Font.custom("LuckiestGuy-Regular", size: 35))
                        .foregroundColor(.white)
                        .bold()
                        .shadow(color: .black, radius: 3)
                    Spacer()
                    Text(player2)
                        .font(Font.custom("LuckiestGuy-Regular", size: 30))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                }
                .padding(.horizontal, 30)

                HStack {
                    if gameState == .cardsFaceDown {
                        CardPlaceholder().rotationEffect(.degrees(90))
                            .padding(.leading, 30)
                    } else {
                        if let card = player1Card {
                            CardView(card: card).rotationEffect(.degrees(90))
                                .padding(.leading, 30)
                        } else {
                            CardPlaceholder().rotationEffect(.degrees(90))
                                .padding(.leading, 30)
                        }
                    }
                    
                    Spacer()

                    if gameState == .cardsFaceDown {
                        CardPlaceholder().rotationEffect(.degrees(-90))
                            .padding(.trailing, 30)
                    } else {
                        if let card = player2Card {
                            CardView(card: card).rotationEffect(.degrees(-90))
                                .padding(.trailing, 30)
                        } else {
                            CardPlaceholder().rotationEffect(.degrees(-90))
                                .padding(.trailing, 30)
                        }
                    }
                }
                .padding(.horizontal, 40)

                Spacer()
            }

            if showInfo {
                KrigInfoView { showInfo = false }
                    .transition(.opacity)
            }

            // 🎉 Custom Pop-up View
            if showPopup {
                ResultPopupView(message: resultMessage)
                    .transition(.opacity)
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
        .onTapGesture { handleTap() }
    }
    
    private func handleTap() {
        switch gameState {
        case .cardsFaceDown:
            playRound()
            gameState = .cardsRevealed
            showPopup = true // Show popup and keep it visible

        case .cardsRevealed:
            showPopup = false // Hide popup when tapping again
            gameState = .preparingNextRound
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if let winner = pendingWinner {
                    replacePlayer(winner: winner) // Swap player AFTER popup is dismissed
                }
                resetGame()
                gameState = .cardsFaceDown
            }

        case .preparingNextRound:
            break // Ignore taps while preparing the next round
        }
    }
    
    // MARK: - Game Logic
    private func playRound() {
        let newCard1 = deck.drawCard()
        let newCard2 = deck.drawCard()
        
        player1Card = newCard1
        player2Card = newCard2
        
        let winner = determineWinner(card1: newCard1, card2: newCard2)
        
        if winner == 1 {
            resultMessage = "\(player1) vant! \(player2) drikker \(1 * sipMultiplier) slurk(er). \(player1) deler ut \(2 * sipMultiplier) slurker."
            pendingWinner = player1
            sipMultiplier = 1
            isWar = false
        } else if winner == 2 {
            resultMessage = "\(player2) vant! \(player1) drikker \(1 * sipMultiplier) slurk(er). \(player2) deler ut \(2 * sipMultiplier) slurker."
            pendingWinner = player2
            sipMultiplier = 1
            isWar = false
        } else {
            sipMultiplier *= 2
            resultMessage = "🔥 KRIG! 🔥 Sips dobles! Trykk for å trekke igjen!"
            isWar = true
            pendingWinner = nil
        }
        
        showPopup = true
        
    }
    
    private func resetGame() {
            player1Card = nil
            player2Card = nil
        }
    
    // Replace the winner with a new random player (ensuring no repeats)
    private func replacePlayer(winner: String) {
        let eligiblePlayers = players.filter { $0 != winner && $0 != lastNewPlayer }

        if let newPlayer = eligiblePlayers.randomElement() {
            lastNewPlayer = newPlayer
            if player1 == winner {
                player1 = newPlayer

                // Prevent self-matches by changing player2 if needed
                if player1 == player2 {
                    player2 = eligiblePlayers.filter { $0 != player1 }.randomElement() ?? player2
                }
            } else {
                player2 = newPlayer

                // Prevent self-matches by changing player1 if needed
                if player1 == player2 {
                    player1 = eligiblePlayers.filter { $0 != player2 }.randomElement() ?? player1
                }
            }
        }
    }
    
    // Compare card values
    private func determineWinner(card1: Card, card2: Card) -> Int {
            let rankOrder: [String: Int] = ["2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10, "J": 11, "Q": 12, "K": 13, "A": 14]
            let value1 = rankOrder[card1.rank] ?? 0
            let value2 = rankOrder[card2.rank] ?? 0
            return value1 > value2 ? 1 : (value1 < value2 ? 2 : 0)
        }
}

struct ResultPopupView: View {
    let message: String

    var body: some View {
        VStack {
            Text(message)
                .font(Font.custom("LuckiestGuy-Regular", size: 22))
                .foregroundColor(.yellow)
                .padding()
                .background(Color.red.opacity(0.8))
                .cornerRadius(15)
                .shadow(radius: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.opacity)
    }
}

// 🔴 Card Placeholder UI
struct CardPlaceholder: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.red)
            .frame(width: 200, height: 320)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 4))
            .shadow(radius: 5)
            .frame(width: 200, height: 200)
    }
}

// MARK: - Preview
struct KrigGameView_Previews: PreviewProvider {
    static var previews: some View {
        KrigGameView(players: ["Marius", "Sara", "Jonas", "Nruh", "Lukas"])
            .previewInterfaceOrientation(.landscapeRight) // ✅ Landscape mode
    }
}
