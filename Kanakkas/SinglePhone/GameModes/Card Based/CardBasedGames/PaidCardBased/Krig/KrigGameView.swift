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
    let players: [String] // List of players
    @State private var player1: String
    @State private var player2: String
    @StateObject private var deck = InfiniteDeck() // Deck of cards
    @State private var player1Card: Card?
    @State private var player2Card: Card?
    @State private var showInfo = false
    @State private var resultText: String = "Trykk for å trekke kort"
    @State private var isWar = false
    @State private var sipMultiplier = 1
    @State private var lastNewPlayer: String? = nil
    @State private var gameState: GameState = .cardsFaceDown
    @State private var pendingWinner: String? = nil // Stores the winner for later replacement

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
                
                // Title Bar
                HStack {
                    CustomBackButton()
                    Spacer()
                    ZStack {
                        Text("Krig")
                            .font(Font.custom("LuckiestGuy-Regular", size: 63))
                            .foregroundColor(.red)
                            .bold()
                            .shadow(color: .red, radius: 5)
                        
                        Text("Krig")
                            .font(Font.custom("LuckiestGuy-Regular", size: 60))
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
                
                // Players Row
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
                
                // Cards Row
                HStack {
                    if gameState == .cardsFaceDown {
                        CardPlaceholder()
                            .rotationEffect(.degrees(90))
                            .padding(.leading, 30)
                    } else {
                        if let card = player1Card {
                            CardView(card: card)
                                .rotationEffect(.degrees(90))
                                .padding(.leading, 30)
                        } else {
                            CardPlaceholder()
                                .rotationEffect(.degrees(90))
                                .padding(.leading, 30)
                        }
                    }
                    
                    Spacer()
                    
                    if gameState == .cardsFaceDown {
                        CardPlaceholder()
                            .rotationEffect(.degrees(-90))
                            .padding(.trailing, 30)
                    } else {
                        if let card = player2Card {
                            CardView(card: card)
                                .rotationEffect(.degrees(-90))
                                .padding(.trailing, 30)
                        } else {
                            CardPlaceholder()
                                .rotationEffect(.degrees(-90))
                                .padding(.trailing, 30)
                        }
                    }
                }
                .padding(.horizontal, 40)
                
                // Result Message
                Text(resultText)
                    .font(Font.custom("LuckiestGuy-Regular", size: 25))
                    .foregroundColor(.yellow)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding(.top, 10)
                
            }
            
            if showInfo {
                KrigInfoView {
                    showInfo = false
                }
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
                // Flip the cards
                playRound()
                gameState = .cardsRevealed
            
            case .cardsRevealed:
                // Hide cards and set up for next round
                gameState = .preparingNextRound
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if let winner = pendingWinner {
                        replacePlayer(winner: winner) // Swap player AFTER cards flip back
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
            guard let newCard1 = deck.drawCard() as Card?, let newCard2 = deck.drawCard() as Card? else { return }
            
            player1Card = newCard1
            player2Card = newCard2
            
            let winner = determineWinner(card1: newCard1, card2: newCard2)
            
            if winner == 1 {
                // Player 1 wins
                resultText = "\(player1) vant! \(player2) drikker \(1 * sipMultiplier) slurk(er)."
                resultText += " \(player1) deler ut \(2 * sipMultiplier) slurker."
                pendingWinner = player1 // Store winner but don't replace yet
                sipMultiplier = 1
                isWar = false
            } else if winner == 2 {
                // Player 2 wins
                resultText = "\(player2) vant! \(player1) drikker \(1 * sipMultiplier) slurk(er)."
                resultText += " \(player2) deler ut \(2 * sipMultiplier) slurker."
                pendingWinner = player2 // Store winner but don't replace yet
                sipMultiplier = 1
                isWar = false
            } else {
                // War
                sipMultiplier *= 2
                resultText = "🔥 KRIG! 🔥 Sips dobles! Trykk for å trekke igjen!"
                isWar = true
                pendingWinner = nil // No one wins yet
            }
        }

        private func resetGame() {
            player1Card = nil
            player2Card = nil
            resultText = "Trykk for å trekke kort"
        }
    
    // Replace the winner with a new random player (ensuring no repeats)
    private func replacePlayer(winner: String) {
            let eligiblePlayers = players.filter { $0 != winner && $0 != lastNewPlayer }
            if let newPlayer = eligiblePlayers.randomElement() {
                lastNewPlayer = newPlayer
                if player1 == winner {
                    player1 = newPlayer
                } else {
                    player2 = newPlayer
                }
            }
        }
    
    // Compare card values
    private func determineWinner(card1: Card, card2: Card) -> Int {
        let rankOrder: [String: Int] = [
            "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10,
            "J": 11, "Q": 12, "K": 13, "A": 14
        ]
        
        let value1 = rankOrder[card1.rank] ?? 0
        let value2 = rankOrder[card2.rank] ?? 0
        
        if value1 > value2 {
            return 1 // Player 1 wins
        } else if value1 < value2 {
            return 2 // Player 2 wins
        } else {
            return 0 // War!
        }
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
